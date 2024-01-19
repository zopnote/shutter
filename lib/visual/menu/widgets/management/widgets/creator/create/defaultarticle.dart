import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/visual/article/data/articlecontent.dart';
import 'package:shutter/core/visual/article/displaylocation.dart';
import 'package:shutter/core/visual/article/properties/articleboxproperties.dart';
import 'package:shutter/core/visual/article/properties/articlecardproperties.dart';
import 'package:shutter/core/visual/article/properties/articlepageproperties.dart';
import 'package:shutter/core/visual/article/properties/children/articlecardbackground.dart';
import 'package:shutter/core/visual/article/properties/children/articlepageattachments.dart';
import 'package:shutter/core/visual/article/properties/children/attachments/children/attachmentaudio.dart';
import 'package:shutter/core/visual/article/properties/children/attachments/children/attachmentimage.dart';
import 'package:shutter/core/visual/article/properties/children/attachments/children/attachmenturl.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/core/wrapper/network/services/mysql/DataBase.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle/attachments.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle/content.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle/preview.dart';
import 'package:shutter/visual/startup/articlepolicy.dart';
import 'package:uuid/uuid.dart';

import 'defaultarticle/articlecache.dart';

class DefaultArticle extends StatefulWidget {
  static ArticleCache articleCache = ArticleCache();
  static bool finishedPreview = false;
  static bool finishedContent = false;

  Future<void> create(BuildContext context) async {
    DefaultArticle.articleCache.displayLocation = DisplayLocation.Spotlight;
    if (!DefaultArticle.finishedPreview ||
        !DefaultArticle.finishedContent ||
        DefaultArticle.articleCache.displayLocation == null) {
      ShutterDialog.show(
          context, 'Dein Artikel ist unvollständig. Überprüfe ihn bitte.');
      return;
    }

    //All is complete
    String? suuid;
    if (DefaultArticle.articleCache.backgroundImage != null) {
      var uuid = const Uuid();
      suuid = uuid.v4();
      Database.image().insert(
          suuid,
          await _convertXFileToUint8List(
              DefaultArticle.articleCache.backgroundImage!));
    }
    List<AttachmentAudio>? aAudio;
    List<AttachmentImage>? aImage;
    List<AttachmentUrl>? aUrl;
    bool attachments = false;
    if (DefaultArticle.articleCache.attachmentImages != null) {
      int index = 0;
      for (XFile file in DefaultArticle.articleCache.attachmentImages!) {
        var uuid = const Uuid();
        String a = uuid.v4();
        Database.image().insert(a, await _convertXFileToUint8List(file));
        aImage ??= [];
        aImage.add(AttachmentImage(name: 'Bild $index', imageAdress: a));
        index++;
      }
      attachments = true;
    }

    if (DefaultArticle.articleCache.attachmentAudioUrls != null) {
      for (Map<String, String> v
          in DefaultArticle.articleCache.attachmentAudioUrls!) {
        aAudio ??= [];
        aAudio.add(AttachmentAudio(url: v.values.first, name: v.keys.first));
      }
      attachments = true;
    }

    if (DefaultArticle.articleCache.attachmentUrls != null) {
      for (Map<String, String> v
          in DefaultArticle.articleCache.attachmentUrls!) {
        aUrl ??= [];
        aUrl.add(AttachmentUrl(
          url: v.values.first,
          name: v.keys.first,
          icon: Ionicons.link,
        ));
      }
      attachments = true;
    }

    Article article = Article(
      creatorID: Data.creatorID!,
      boxProperties: ArticleBoxProperties(),
      content: ArticleContent(
        title: DefaultArticle.articleCache.title!,
        author: Data.creatorID!,
        description: DefaultArticle.articleCache.description!,
        contentText: DefaultArticle.articleCache.content!,
      ),
      cardProperties: ArticleCardProperties(
        textColor: DefaultArticle.articleCache.textColor,
        strokeColorForImageText: DefaultArticle.articleCache.strokeColor,
        strokeWidthForImageText: DefaultArticle.articleCache.strokeWidth,
        openPageOnClick: DefaultArticle.articleCache.openPage!,
        articleCardBackground: (DefaultArticle.articleCache.backgroundCard!
            ? ArticleCardBackground(
                backgroundColor: DefaultArticle.articleCache.backgroundColor,
                backgroundImageID: suuid,
              )
            : null),
      ),
      pageProperties: ArticlePageProperties(
        openPageOnClick: DefaultArticle.articleCache.openPage!,
        attachments: attachments
            ? ArticlePageAttachments(
                audios: aAudio,
                images: aImage,
                urls: aUrl,
              )
            : null,
      ),
    );

    Database.article()
        .insert(DefaultArticle.articleCache.displayLocation!, article);
    List<dynamic> list = await Database.creator().getArticles(Data.creatorID!);
    list.add(article.articleID);
    await Database.creator().insertArticles(Data.creatorID!, list);
  }

  Future<Uint8List> _convertXFileToUint8List(XFile xFile) async {
    File file = File(xFile.path);
    Uint8List uint8list = await file.readAsBytes();

    return uint8list;
  }

  @override
  State<DefaultArticle> createState() => _DefaultArticleState();
}

class _DefaultArticleState extends State<DefaultArticle> {
  static bool yes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.colorBackground,
      appBar: AppBar(
          title: const Text('\nEinen Artikel erstellen',
              textScaleFactor: 1.1,
              style: TextStyle(fontWeight: FontWeight.w600)),
          centerTitle: true,
          backgroundColor: Data.colorBackground,
          foregroundColor: Data.colorText,
          elevation: 0),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          Space(
            height: 60,
          ),
          EntryDA(
              title: 'Vorschau des Artikels',
              child: Center(
                child: DAPreview(),
              )),
          EntryDA(
              title: 'Inhalt des Artikels',
              child: Center(
                child: _obj(DAPage()),
              )),
          EntryDA(
              title: 'Anhänge zum Artikel',
              child: Center(
                child: _obj(DAAttachments()),
              )),
          Space(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: yes,
                  onChanged: (a) {
                    setState(() {
                      yes = a!;
                    });
                  },
                  tristate: false,
                  activeColor: Data.colorSelected,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)))),
              const Text('Ich bin mit der '),
              GestureDetector(
                child: const Text('DSGVO-A',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    )),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ArticlePolicy().build(context);
                  }));
                },
              ),
              const Text(' einverstanden.   '),
            ],
          ),
          Space(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Data.colorSelected),
                  elevation: const MaterialStatePropertyAll(0),
                  fixedSize: const MaterialStatePropertyAll(Size(215, 60)),
                  maximumSize: const MaterialStatePropertyAll(Size(215, 40)),
                  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))))),
              onPressed: () {
                if (!yes) {
                  ShutterDialog.show(
                      context, 'Bitte akzeptiere die Datenschutzerklärung.');
                  return;
                }
                widget.create(context);
                Navigator.pop(context);
                ShutterDialog.show(context,
                    'Dein Artikel wird nun vom Team bewertet und veröffentlicht sofern er ein passendes Design, wichtige information & keine rechtlich geschützten Bilder beinhaltet.');
                return;
              },
              child: Text(
                'Klicke zum abschicken',
                textAlign: TextAlign.center,
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Data.colorBackground,
                ),
              ),
            ),
          ),
          Space(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _obj(Widget child) {
    DefaultArticle.articleCache.openPage ??= true;
    return Column(
      children: [
        Space(height: 30),
        (DefaultArticle.articleCache.openPage! ? child : Space()),
      ],
    );
  }
}

class EntryDA extends StatefulWidget {
  final String title;
  final Widget child;

  EntryDA({
    required this.title,
    required this.child,
  });

  @override
  State<EntryDA> createState() => _EntryDAState();
}

class _EntryDAState extends State<EntryDA> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 270,
            decoration: const BoxDecoration(
              color: Color(0xFFE3E3E3),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Data.colorSelected,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Icon(
                        open
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.keyboard_arrow_up_rounded,
                        color: const Color(0xFFE3E3E3),
                        size: 40,
                      )),
                  onTap: () {
                    if (!open) {
                      setState(() {
                        open = true;
                      });
                      return;
                    }
                    setState(() {
                      open = false;
                    });
                    return;
                  },
                ),
                Space(
                  width: 25,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Data.colorText, fontWeight: FontWeight.w500),
                  textScaleFactor: 1.1,
                ),
              ],
            ),
          ),
        ),
        (open ? widget.child : Space()),
      ],
    );
  }
}
