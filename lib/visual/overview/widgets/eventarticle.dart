import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/article/cache/articlecontainer.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/article/load/articleloader.dart';

class PageEventArticle extends StatefulWidget {
  @override
  State<PageEventArticle> createState() => _PageEventArticleState();
}

class _PageEventArticleState extends State<PageEventArticle> {
  static late List<Article> events;
  static bool loaded = false;

  Future<void> load() async {
    await ArticleLoader.execute();
    events = ArticleContainer.events;
    loaded = true;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return LottieBuilder.asset(
        'assets/animations/loading.json',
        height: 120,
        width: 120,
      );
    }
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return events[index].toArticleCard();
              },
              scrollDirection: Axis.horizontal,
              reverse: true,
              physics: const BouncingScrollPhysics(),
            ),
          ),
        ),
      ],
    );
  }
}
