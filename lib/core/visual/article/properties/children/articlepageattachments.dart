import 'package:shutter/core/visual/article/properties/children/attachments/children/attachmentaudio.dart';
import 'package:shutter/core/visual/article/properties/children/attachments/children/attachmentimage.dart';

import 'attachments/children/attachmenturl.dart';

class ArticlePageAttachments {
  List<AttachmentImage>? images;
  List<AttachmentAudio>? audios;
  List<AttachmentUrl>? urls;

  ArticlePageAttachments({
    this.audios,
    this.images,
    this.urls,
  });

  List<AttachmentImage>? getImages() {
    return images;
  }

  List<AttachmentAudio>? getAudios() {
    return audios;
  }

  List<AttachmentUrl>? getURLs() {
    return urls;
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images?.map((image) => image.toJson()).toList(),
      'audios': audios?.map((audio) => audio.toJson()).toList(),
      'urls': urls?.map((url) => url.toJson()).toList(),
    };
  }
}
