import 'package:flutter/cupertino.dart';

class ArticleCardBackground {
  Color? backgroundColor;
  String? backgroundImageID;

  ArticleCardBackground({
    this.backgroundImageID,
    this.backgroundColor,
  }) {
    if (backgroundImageID != null && backgroundColor != null) {
      backgroundImageID = null;
      print(
          'ERROR: You cant set a background image and a background color. Choose one of both. (Exception with a instance of ArticleBackground)');
    }
  }

  String? getBackgroundImage() {
    return backgroundImageID;
  }

  Color? getBackgroundColor() {
    return backgroundColor;
  }

  Map<String, dynamic> toJson() {
    return {
      'backgroundColor': backgroundColor != null
          ? '#${backgroundColor!.value.toRadixString(16)}'
          : null,
      'backgroundImage': backgroundImageID,
    };
  }
}
