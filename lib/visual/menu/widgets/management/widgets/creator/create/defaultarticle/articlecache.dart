import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shutter/core/visual/article/displaylocation.dart';

class ArticleCache {
  String? title;
  String? description;
  bool? notify;
  bool? openPage;
  String? content;
  bool? backgroundCard;
  Color? textColor;
  Color? strokeColor;
  double? strokeWidth;
  Color? backgroundColor;
  XFile? backgroundImage;
  DisplayLocation? displayLocation;
  List<XFile>? attachmentImages;
  List<Map<String, String>>? attachmentAudioUrls;
  List<Map<String, String>>? attachmentUrls;

  ArticleCache({
    this.textColor,
    this.strokeWidth,
    this.strokeColor,
    this.title,
    this.displayLocation,
    this.description,
    this.notify,
    this.openPage,
    this.content,
    this.backgroundCard,
    this.backgroundColor,
    this.backgroundImage,
    this.attachmentImages,
    this.attachmentAudioUrls,
    this.attachmentUrls,
  });
}
