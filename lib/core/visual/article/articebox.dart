import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/schemes.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/visual/article/articlepage.dart';
import 'package:shutter/core/wrapper/general/general.dart';

class ArticleBox extends StatefulWidget {
  final Article article;

  const ArticleBox(
    this.article, {
    Key? key,
  }) : super(key: key);

  @override
  State<ArticleBox> createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
              decoration: Schemes.defaultBoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: General().getScreenWidth() - 53,
                        child: Text(
                          widget.article.content.title,
                          textScaleFactor: 2.3,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Data.colorText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 22,
                      ),
                      Text(
                        'von ' + widget.article.content.author,
                        textScaleFactor: 1.4,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Data.colorText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: SizedBox(
                      width: General().getScreenWidth() - 56,
                      child: Text(
                        widget.article.content.description,
                        textScaleFactor: 1.55,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Data.colorText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: SizedBox(
                      width: General().getScreenWidth() - 58,
                      child: ExtendTextToPageWidget(
                        article: widget.article,
                        maxLength: 265,
                        fullText: widget.article.content.contentText,
                        textScaleFactor: 1.55,
                        fontWeightOfText: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class ExtendTextToPageWidget extends StatefulWidget {
  final Article article;
  final int maxLength;
  final String fullText;
  final double textScaleFactor;
  final FontWeight fontWeightOfText;

  const ExtendTextToPageWidget(
      {super.key,
      required this.maxLength,
      required this.article,
      required this.fullText,
      required this.textScaleFactor,
      required this.fontWeightOfText});

  @override
  _ExtendTextToPageWidgetState createState() => _ExtendTextToPageWidgetState();
}

class _ExtendTextToPageWidgetState extends State<ExtendTextToPageWidget> {
  bool isFullTextVisible = false;

  @override
  Widget build(BuildContext context) {
    final String displayText = isFullTextVisible
        ? widget.fullText
        : widget.fullText.substring(0, widget.maxLength);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
          textScaleFactor: widget.textScaleFactor,
          style: TextStyle(
              color: Data.colorText, fontWeight: widget.fontWeightOfText),
        ),
        if (widget.fullText.length > widget.maxLength)
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticlePage(widget.article),
                ),
              );
            },
            child: Text(
              isFullTextVisible ? "Weniger anzeigen" : "Mehr anzeigen",
              style: TextStyle(
                  color: Data.colorSelected, fontWeight: FontWeight.bold),
              textScaleFactor: widget.textScaleFactor,
            ),
          ),
      ],
    );
  }
}
