import 'package:shutter/core/visual/article/data/articlecontent.dart';
import 'package:shutter/core/visual/article/properties/articleboxproperties.dart';
import 'package:shutter/core/visual/article/properties/articlecardproperties.dart';
import 'package:shutter/core/visual/article/properties/articlepageproperties.dart';
import 'package:uuid/uuid.dart';

import 'articebox.dart';
import 'articlecard.dart';
import 'articlepage.dart';

class Article {
  final String creatorID;
  final ArticleContent content;
  final ArticleCardProperties cardProperties;
  final ArticleBoxProperties boxProperties;
  final ArticlePageProperties pageProperties;
  String? articleID;

  Article({
    this.articleID,
    required this.creatorID,
    required this.content,
    required this.cardProperties,
    required this.boxProperties,
    required this.pageProperties,
  }) {
    // ignore: prefer_conditional_assignment
    if (articleID == null) {
      articleID = const Uuid().v4();
    }
  }

  ArticleCard toArticleCard() {
    return ArticleCard(this);
  }

  ArticlePage toArticlePage() {
    return ArticlePage(this);
  }

  ArticleBox toArticleBox() {
    return ArticleBox(this);
  }

  Map<String, dynamic> toJson() {
    return {
      'articleID': articleID,
      'creatorID': creatorID,
      'content': content.toJson(),
      'cardProperties': cardProperties.toJson(),
      'boxProperties': boxProperties.toJson(),
      'pageProperties': pageProperties.toJson(),
    };
  }
}
