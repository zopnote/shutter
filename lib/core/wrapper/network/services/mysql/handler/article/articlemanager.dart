import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/visual/article/data/articlecontent.dart';
import 'package:shutter/core/visual/article/properties/articleboxproperties.dart';
import 'package:shutter/core/visual/article/properties/articlecardproperties.dart';
import 'package:shutter/core/visual/article/properties/articlepageproperties.dart';
import 'package:shutter/core/visual/article/properties/children/articlecardbackground.dart';
import 'package:shutter/core/visual/article/properties/children/articlepageattachments.dart';
import 'package:shutter/core/visual/article/properties/children/attachments/children/attachmentaudio.dart';
import 'package:shutter/core/visual/article/properties/children/attachments/children/attachmentimage.dart';
import 'package:shutter/core/visual/article/properties/children/attachments/children/attachmenturl.dart';

class ArticleManager {
  static String articleToJson(Article article) {
    final articleJson = json.encode(article.toJson());
    return articleJson;
  }

  static Article? generateArticle(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final String articleID = jsonMap['articleID'];
    final String creatorID = jsonMap['creatorID'];
    final Map<String, dynamic> content = jsonMap['content'];
    final Map<String, dynamic> cardProperties = jsonMap['cardProperties'];
    final Map<String, dynamic> boxProperties = jsonMap['boxProperties'];
    final Map<String, dynamic> pageProperties = jsonMap['pageProperties'];
    ArticleContent articleContent = toArticleContent(content);
    ArticleCardProperties articleCardProperties =
        toArticleCardProperties(cardProperties);
    ArticleBoxProperties articleBoxProperties =
        toArticleBoxProperties(boxProperties);
    ArticlePageProperties articlePageProperties =
        toArticlePageProperties(pageProperties);
    return Article(
      articleID: articleID,
      creatorID: creatorID,
      content: articleContent,
      boxProperties: articleBoxProperties,
      cardProperties: articleCardProperties,
      pageProperties: articlePageProperties,
    );
  }

  static Color? _parseHexColor(String? hexColor) {
    final buffer = StringBuffer();
    if (hexColor?.length == 6 || hexColor?.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hexColor?.replaceFirst('#', ''));
    if (buffer.toString() == 'null') {
      return null;
    }

    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static List<AttachmentUrl> _parseToAttachmentUrls(
      List<Map<String, dynamic>> maps) {
    final List<AttachmentUrl> attachmentUrls = [];

    for (final map in maps) {
      final name = map['name'] as String;
      final url = map['url'] as String;
      final icon = map['icon'] as String;

      final attachmentUrl = AttachmentUrl(
          name: name, url: url, icon: IoniconsData(int.parse(icon)));
      attachmentUrls.add(attachmentUrl);
    }

    return attachmentUrls;
  }

  static List<AttachmentAudio> _parseToAttachmentAudios(
      List<Map<String, dynamic>> maps) {
    final List<AttachmentAudio> attachmentAudios = [];

    for (final map in maps) {
      final name = map['name'] as String;
      final url = map['url'] as String;

      final attachmentAudio = AttachmentAudio(name: name, url: url);
      attachmentAudios.add(attachmentAudio);
    }

    return attachmentAudios;
  }

  static List<AttachmentImage> _parseToAttachmentImages(
      List<Map<String, dynamic>> maps) {
    final List<AttachmentImage> attachmentImages = [];

    for (final map in maps) {
      final name = map['name'] as String;
      final image = map['image'] as String;

      final attachmentImage = AttachmentImage(name: name, imageAdress: image);
      attachmentImages.add(attachmentImage);
    }

    return attachmentImages;
  }

  static ArticleContent toArticleContent(Map<String, dynamic> map) {
    final String title = map['title'];
    final String author = map['author'];
    final String description = map['description'];
    final String contentText = map['contentText'];
    return ArticleContent(
        title: title,
        author: author,
        description: description,
        contentText: contentText);
  }

  static ArticleCardProperties toArticleCardProperties(
      Map<String, dynamic> map) {
    final bool? defaultDecoration = map['defaultDecoration'] as bool?;
    final String? textColor = map['textColor'];
    final String? strokeColorForImageText = map['strokeColorForImageText'];
    final double? strokeWidthForImageText =
        map['strokeWidthForImageText'] as double?;
    final Map<String, dynamic> articleCardBackground =
        map['articleCardBackground'];
    final String? backgroundColor = articleCardBackground['backgroundColor'];
    final String? backgroundImage = articleCardBackground['backgroundImage'];
    final openPageOnClick = map['openPageOnClick'] as bool;
    return ArticleCardProperties(
      openPageOnClick: openPageOnClick,
      articleCardBackground: ArticleCardBackground(
          backgroundColor: _parseHexColor(backgroundColor),
          backgroundImageID: backgroundImage),
      defaultDecoration: defaultDecoration,
      strokeColorForImageText: _parseHexColor(strokeColorForImageText),
      strokeWidthForImageText: strokeWidthForImageText,
      textColor: _parseHexColor(textColor),
    );
  }

  static ArticlePageProperties toArticlePageProperties(
      Map<String, dynamic> map) {
    final Map<String, dynamic>? attachments = map['attachments'];
    if (attachments == null) {
      return ArticlePageProperties(
        openPageOnClick: true,
      );
    }
    final List<dynamic>? images = attachments['images'];
    final List<dynamic>? audios = attachments['audios'];
    final List<dynamic>? urls = attachments['urls'];
    List<AttachmentImage>? buildedImages;
    List<AttachmentAudio>? buildedAudios;
    List<AttachmentUrl>? buildedUrls;
    if (images != null) {
      buildedImages = [];
      for (var imageData in images) {
        String name = imageData['name'];
        String imageAddress = imageData['image'];

        AttachmentImage attachmentImage = AttachmentImage(
          name: name,
          imageAdress: imageAddress,
        );
        buildedImages.add(attachmentImage);
      }
    }
    if (audios != null) {
      buildedAudios = [];
      for (var imageData in audios) {
        String name = imageData['name'];
        String audioUrl = imageData['url'];

        AttachmentAudio attachmentAudio = AttachmentAudio(
          url: audioUrl,
          name: name,
        );

        buildedAudios.add(attachmentAudio);
      }
    }
    if (urls != null) {
      buildedUrls = [];
      for (var imageData in urls) {
        String name = imageData['name'];
        String url = imageData['url'];
        String icon = imageData['icon'];

        AttachmentUrl attachmentUrl = AttachmentUrl(
          url: url,
          name: name,
          icon: Ionicons.open,
        );

        buildedUrls.add(attachmentUrl);
      }
    }
    return ArticlePageProperties(
      openPageOnClick: true,
      attachments: ArticlePageAttachments(
        images: buildedImages,
        audios: buildedAudios,
        urls: buildedUrls,
      ),
    );
  }

  static ArticleBoxProperties toArticleBoxProperties(Map<String, dynamic> map) {
    return ArticleBoxProperties();
  }
}
