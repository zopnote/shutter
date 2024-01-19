import 'package:flutter/material.dart';
import 'package:shutter/core/visual/article/properties/children/articlecardbackground.dart';

class ArticleCardProperties {
  bool? defaultDecoration;
  Color? textColor;
  Color? strokeColorForImageText;
  double? strokeWidthForImageText;
  ArticleCardBackground? articleCardBackground;
  final bool openPageOnClick;

  ArticleCardProperties({
    required this.openPageOnClick,
    this.articleCardBackground,
    this.strokeWidthForImageText,
    this.textColor,
    this.strokeColorForImageText,
    this.defaultDecoration,
  });

  bool? get getDefaultDecoration => defaultDecoration;

  Color? get getTextColor => textColor;

  Color? get getStrokeColorForImageText => strokeColorForImageText;

  double? get getStrokeWidthForImageText => strokeWidthForImageText;

  ArticleCardBackground? get getArticleCardBackground => articleCardBackground;

  bool get getOpenPageOnClick => openPageOnClick;

  Map<String, dynamic> toJson() {
    return {
      'defaultDecoration': defaultDecoration,
      'textColor':
          textColor != null ? '#${textColor!.value.toRadixString(16)}' : null,
      'strokeColorForImageText': strokeColorForImageText != null
          ? '#${strokeColorForImageText!.value.toRadixString(16)}'
          : null,
      'strokeWidthForImageText': strokeWidthForImageText,
      'articleCardBackground': articleCardBackground != null
          ? articleCardBackground!.toJson()
          : ArticleCardBackground(backgroundColor: Colors.transparent),
      'openPageOnClick': openPageOnClick,
    };
  }
}
