import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/visual/article/articlepage.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:stroke_text/stroke_text.dart';

class ArticleCard extends StatefulWidget {
  final Article article;

  const ArticleCard(
    this.article, {
    Key? key,
  }) : super(key: key);

  String getTitle() {
    return article.content.title;
  }

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  Future<void> load() async {
    if (widget
            .article.cardProperties.articleCardBackground!.backgroundImageID !=
        null) {
      Blob? blob = await Database.image().get(widget
          .article.cardProperties.articleCardBackground!.backgroundImageID!);

      if (blob != null) {
        final List<int> bytes = blob.toBytes();
        setState(() {
          imageL = MemoryImage(Uint8List.fromList(bytes));
        });
      }
    }
  }

  MemoryImage? imageL;

  @override
  void initState() {
    load();
    super.initState();
  }

  late bool colorOrImage;
  bool activeSize = false;
  bool activeBackground = false;
  late Color color;
  late String image;
  late bool normalDecoration;
  late Color textColor;
  static final List<Color> defaultColors = [
    const Color(0xFF838AD2),
    const Color(0xFF7865A8),
    const Color(0xFF8D80C7),
    const Color(0xFFA99CDE),
    const Color(0xFF7075AF),
    const Color(0xFF8B73C5),
    const Color(0xFF7362AB),
    const Color(0xFFA799E7),
  ];

  Color getRandomItem(List<Color> items) {
    if (items.isEmpty) {
      throw Exception('Die Liste ist leer.');
    }

    Random random = Random();
    int randomIndex = random.nextInt(items.length);
    return items[randomIndex];
  }

  Color darkenColor(Color color, double factor) {
    assert(factor >= 0.0 && factor <= 1.0);

    int red = (color.red * (1.0 - factor)).toInt();
    int green = (color.green * (1.0 - factor)).toInt();
    int blue = (color.blue * (1.0 - factor)).toInt();

    return Color.fromARGB(color.alpha, red, green, blue);
  }

  @override
  Widget build(BuildContext context) {
    final articleCardBackground =
        widget.article.cardProperties.articleCardBackground;
    print(articleCardBackground);
    if (articleCardBackground != null) {
      activeBackground = true;
      Color? color = articleCardBackground.backgroundColor;
      String? image = articleCardBackground.backgroundImageID;
      if (image != null) {
        this.image = image;
        colorOrImage = false;
      }
      if (color != null) {
        this.color = color;
        colorOrImage = true;
      }
      if (color == null && image == null) {
        print(
            'If you add the articleCardBackground parameter, give it content. (Exception in a instance of ArticleCard with a instance of ArticleBackground)');
        activeBackground = false;
      }
    }
    if (widget.article.cardProperties.defaultDecoration == null) {
      normalDecoration = false;
    } else {
      if (widget.article.cardProperties.defaultDecoration == true) {
        normalDecoration = true;
      } else {
        normalDecoration = false;
      }
    }
    textColor = Data.colorText;
    if (widget.article.cardProperties.textColor != null) {
      textColor = widget.article.cardProperties.textColor!;
    }
    Color randomizedColor = getRandomItem(defaultColors);
    Color buttonColor = darkenColor(randomizedColor, 0.3);

    if (imageL == null && !colorOrImage) {
      colorOrImage = true;
      color = const Color(0xFFFFFFFF);
    }
    if (normalDecoration) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            color: randomizedColor,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: const Alignment(-0.05, 0.80),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(buttonColor),
                      shadowColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Klicke zum Öffnen',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Align(
                alignment: const Alignment(-0.05, -0.75),
                child: Text(
                  widget.article.content.title,
                  textScaleFactor: 1.85,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                child: Align(
                  alignment: const Alignment(-0.05, 0.10),
                  child: Text(
                    widget.article.content.description,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      overlayColor:
                          MaterialStatePropertyAll(Data.colorBackground),
                      shadowColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      shape: const MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                      fixedSize:
                          const MaterialStatePropertyAll(Size(1000, 1000)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticlePage(widget.article),
                        ),
                      );
                    },
                    child: const Text('')),
              ),
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 230,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          image: activeBackground
              ? (colorOrImage
                  ? null
                  : DecorationImage(
                      fit: BoxFit.fill,
                      image: Image(image: imageL!).image,
                    ))
              : null,
          color: activeBackground ? (colorOrImage ? color : null) : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: const Alignment(-0.05, 0.80),
              child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    shadowColor: MaterialStatePropertyAll(Colors.black),
                    elevation: MaterialStatePropertyAll(0.0001),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Klicke zum Öffnen',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            Align(
              alignment: const Alignment(-0.05, -0.75),
              child:
                  widget.article.cardProperties.strokeColorForImageText == null
                      ? SizedBox(
                          width: 270,
                          child: Text(
                            widget.article.content.title,
                            textScaleFactor: 1.85,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 250,
                          child: StrokeText(
                            text: widget.article.content.title,
                            textColor: widget.article.cardProperties.textColor!,
                            strokeColor: widget.article.cardProperties
                                .strokeColorForImageText!,
                            strokeWidth: widget.article.cardProperties
                                .strokeWidthForImageText!,
                            textStyle: TextStyle(
                              fontSize: 22,
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
            ),
            SizedBox(
              child: Align(
                alignment: const Alignment(-0.05, 0.10),
                child: widget.article.cardProperties.strokeColorForImageText ==
                        null
                    ? SizedBox(
                        width: 270,
                        child: Text(
                          widget.article.content.description,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 260,
                        child: StrokeText(
                          text: widget.article.content.description,
                          textColor: widget.article.cardProperties.textColor!,
                          strokeColor: widget
                              .article.cardProperties.strokeColorForImageText!,
                          strokeWidth: widget
                              .article.cardProperties.strokeWidthForImageText!,
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
            ),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    overlayColor:
                        MaterialStatePropertyAll(Data.colorBackground),
                    shadowColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25)))),
                    fixedSize: const MaterialStatePropertyAll(Size(1000, 1000)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticlePage(widget.article),
                      ),
                    );
                  },
                  child: const Text('')),
            ),
          ],
        ),
      ),
    );
  }
}
