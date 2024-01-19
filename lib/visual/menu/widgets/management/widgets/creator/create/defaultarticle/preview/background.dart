import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle.dart';

class BackgroundP extends StatefulWidget {
  @override
  State<BackgroundP> createState() => _BackgroundPState();
}

class _BackgroundPState extends State<BackgroundP> {
  static bool mode = false;

  @override
  Widget build(BuildContext context) {
    bool a = true;
    bool b = false;
    if (mode) {
      a = false;
      b = true;
    }
    bool isImageSet = false;
    if (DefaultArticle.articleCache.backgroundImage != null) {
      isImageSet = true;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 370,
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xFFE3E3E3),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: a,
                    onChanged: (v) {
                      setState(() {
                        if (!a) {
                          mode = !v!;
                        }
                      });
                    },
                    tristate: false,
                    activeColor: Data.colorSelected,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
                (a
                    ? Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFF414141), width: 3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Align(
                          alignment: const Alignment(0, -0.6),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    DefaultArticle.articleCache.backgroundColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Icon(Ionicons.color_palette)),
              ],
            ),
            Space(
              width: 12,
            ),
            (a
                ? Container(
                    width: 120,
                    height: 30,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        _createColorEntry(Data.colorSelected),
                        _createColorEntry(const Color(0xFF3E4579)),
                        _createColorEntry(const Color(0xFF9C4DA1)),
                        _createColorEntry(const Color(0xFF797FA2)),
                        _createColorEntry(const Color(0xFFCEB471)),
                        _createColorEntry(const Color(0xFF5E89AB)),
                        _createColorEntry(const Color(0xFFA15D5D)),
                        _createColorEntry(const Color(0xFFABB96D)),
                        _createColorEntry(const Color(0xFF6D944E)),
                        _createColorEntry(const Color(0xFF8850A4)),
                        _createColorEntry(const Color(0xFF99A146)),
                        _createColorEntry(const Color(0xFF9F603D)),
                      ],
                    ))
                : Space()),
            Space(
              width: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: b,
                    onChanged: (v) {
                      setState(() {
                        if (!b) {
                          mode = v!;
                        }
                        if (DefaultArticle.articleCache.backgroundImage !=
                            null) {
                          DefaultArticle.articleCache.backgroundImage = null;
                        }
                      });
                    },
                    tristate: false,
                    activeColor: Data.colorSelected,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
                const Icon(Ionicons.camera)
              ],
            ),
            Space(
              width: 12,
            ),
            (b
                ? GestureDetector(
                    child: Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Data.colorSelected,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: (isImageSet
                            ? Row(
                                children: [
                                  Space(
                                    width: 13,
                                  ),
                                  const Icon(
                                    Ionicons.close,
                                    color: Color(0xFFE3E3E3),
                                    size: 20,
                                  ),
                                  const Text(
                                    '   Ausgewählt',
                                    style: TextStyle(
                                        color: Color(0xFFE3E3E3),
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  Space(
                                    width: 13,
                                  ),
                                  const Icon(
                                    Ionicons.search,
                                    color: Color(0xFFE3E3E3),
                                    size: 20,
                                  ),
                                  const Text(
                                    '   Auswählen',
                                    style: TextStyle(
                                        color: Color(0xFFE3E3E3),
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ))),
                    onTap: () async {
                      if (DefaultArticle.articleCache.backgroundColor != null) {
                        DefaultArticle.articleCache.backgroundColor = null;
                      }
                      if (DefaultArticle.articleCache.backgroundImage != null) {
                        setState(() {
                          DefaultArticle.articleCache.backgroundImage = null;
                        });
                        return;
                      }
                      _pickImage();
                    },
                  )
                : Space()),
          ],
        ),
      ),
    );
  }

  Future _pickImage() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      DefaultArticle.articleCache.backgroundImage = returnedImage;
    });
    return returnedImage;
  }

  Widget _createColorEntry(Color c) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: c,
          ),
        ),
        onTap: () {
          setState(() {
            DefaultArticle.articleCache.backgroundColor = c;
          });
        },
      ),
    );
  }
}
