import 'package:flutter/material.dart';
import 'package:shutter/core/visual/article/articlecard.dart';

import '../../../../../core/data/container/data.dart';

class Widget_Rows {
  static void setContext(BuildContext context) {
    givedContext = context;
  }

  static late BuildContext givedContext;

  static List<ArticleCard> newestInformation = [
    Data.testingArticle.toArticleCard(),
    Data.testingArticle.toArticleCard()
  ];

  static List<ArticleCard> newestSpotlight = [
    Data.testingArticle.toArticleCard(),
    Data.testingArticle.toArticleCard()
  ];

  List<Widget> generateTabBar(List<ArticleCard> cards) {
    List<Widget> widgetsList = [];
    for (int i = 0; i < cards.length; i++) {
      Widget newWidget = Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 55,
          child: Text(
            cards.elementAt(i).getTitle(),
            textScaleFactor: 1.2,
            style: TextStyle(color: Data.colorText),
          ),
        ),
      );
      widgetsList.add(newWidget);
    }
    return widgetsList;
  }
}
