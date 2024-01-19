import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle/preview/background.dart';

class DAPreview extends StatefulWidget {
  @override
  State<DAPreview> createState() => _DAPreviewState();
}

class _DAPreviewState extends State<DAPreview> {
  @override
  Widget build(BuildContext context) {
    return PEntry();
  }
}

class PEntry extends StatefulWidget {
  @override
  State<PEntry> createState() => _PEntryState();
}

class _PEntryState extends State<PEntry> {
  static TextEditingController? titleController;
  static TextEditingController? descController;

  @override
  void initState() {
    descController ??= TextEditingController();
    titleController ??= TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool savedTitle = false;
    bool moreTitle = true;
    if (DefaultArticle.articleCache.title != null &&
        DefaultArticle.articleCache.title == titleController!.text &&
        DefaultArticle.articleCache.title != '') {
      savedTitle = true;
    }
    if (titleController!.text.length > 4) {
      moreTitle = false;
    }
    bool savedDesc = false;
    bool moreDesc = true;
    if (DefaultArticle.articleCache.description != null &&
        DefaultArticle.articleCache.description == descController!.text &&
        DefaultArticle.articleCache.description != '') {
      savedDesc = true;
    }
    if (descController!.text.length > 9) {
      moreDesc = false;
    }
    bool finished = false;
    if (savedTitle && savedDesc && !moreDesc && !moreTitle) {
      finished = true;
    }
    DefaultArticle.finishedPreview = finished;
    DefaultArticle.articleCache.notify ??= false;
    DefaultArticle.articleCache.backgroundCard ??= false;
    DefaultArticle.articleCache.textColor ??= Color(0xFFFFFFFF);
    DefaultArticle.articleCache.strokeWidth ??= 0;
    return SizedBox(
      child: Column(
        children: [
          Space(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 260,
                child: Center(
                  child: TextField(
                    onChanged: (s) {
                      setState(() {});
                    },
                    maxLength: 31,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: titleController,
                    textAlignVertical: const TextAlignVertical(y: -0.65),
                    style:
                        const TextStyle(color: Color(0xFF414141), fontSize: 16),
                    textAlign: TextAlign.start,
                    cursorColor: const Color(0xFF414141),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF414141), width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF7F7CD2), width: 2),
                      ),
                      hoverColor: Color(0xFF414141),
                      labelText: ' Titel (min.5)',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF414141),
                        backgroundColor: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Data.colorSelected,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Icon(
                      savedTitle ? Ionicons.checkmark : Ionicons.save,
                      color: Color(0xFFFFFFFF),
                      size: 20,
                    )),
                onTap: () {
                  if (DefaultArticle.articleCache.title != null &&
                      DefaultArticle.articleCache.title ==
                          titleController!.text) {
                    return;
                  }
                  DefaultArticle.articleCache.title = titleController!.text;
                  setState(() {});
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 260,
                child: Center(
                  child: TextField(
                    onChanged: (s) {
                      setState(() {});
                    },
                    maxLength: 45,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: descController,
                    textAlignVertical: const TextAlignVertical(y: -0.65),
                    style:
                        const TextStyle(color: Color(0xFF414141), fontSize: 16),
                    textAlign: TextAlign.start,
                    cursorColor: const Color(0xFF414141),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF414141), width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF7F7CD2), width: 2),
                      ),
                      hoverColor: Color(0xFF414141),
                      labelText: ' Beschreibung (min.10)',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF414141),
                        backgroundColor: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Data.colorSelected,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Icon(
                      savedDesc ? Ionicons.checkmark : Ionicons.save,
                      color: Color(0xFFFFFFFF),
                      size: 20,
                    )),
                onTap: () {
                  if (DefaultArticle.articleCache.description != null &&
                      DefaultArticle.articleCache.description ==
                          descController!.text) {
                    return;
                  }
                  DefaultArticle.articleCache.description =
                      descController!.text;
                  setState(() {});
                },
              ),
            ],
          ),
          Space(
            height: 30,
          ),

          Text('Textfarbe (Std. Weiß)',
              textScaleFactor: 1.1,
              style: TextStyle(
                  color: Color(0xFF3A3A3A), fontWeight: FontWeight.w500)),
          Space(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF414141), width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Align(
                  alignment: const Alignment(0, -0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: DefaultArticle.articleCache.textColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 30,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Space(
                      width: 6,
                    ),
                    _createColorEntry(const Color(0xFF000000), true),
                    _createColorEntry(const Color(0xFF1F1F1F), true),
                    _createColorEntry(const Color(0xFF464646), true),
                    _createColorEntry(const Color(0xFF777777), true),
                    _createColorEntry(const Color(0xFF9F9F9F), true),
                    _createColorEntry(const Color(0xFFCBCACA), true),
                    _createColorEntry(const Color(0xFFFFFFFF), true),
                  ],
                ),
              ),
            ],
          ),
          Space(
            height: 30,
          ),

          Text(
            'Umstrich \n(ggf. nutzen um Schrift \nvom Hintergrund abzugrenzen.)',
            textScaleFactor: 1.1,
            style: TextStyle(
                color: Color(0xFF3A3A3A), fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          Space(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF414141), width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Align(
                  alignment: const Alignment(0, -0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: DefaultArticle.articleCache.strokeColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 30,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Space(
                      width: 6,
                    ),
                    _createColorEntry(const Color(0xFF000000), false),
                    _createColorEntry(const Color(0xFF1F1F1F), false),
                    _createColorEntry(const Color(0xFF464646), false),
                    _createColorEntry(const Color(0xFF777777), false),
                    _createColorEntry(const Color(0xFF9F9F9F), false),
                    _createColorEntry(const Color(0xFFCBCACA), false),
                    _createColorEntry(const Color(0xFFFFFFFF), false),
                  ],
                ),
              ),
            ],
          ),
          Space(
            height: 30,
          ),
          Center(
            child: Container(
              width: 166,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Color(0xFFE3E3E3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (DefaultArticle.articleCache.strokeWidth == null) {
                          DefaultArticle.articleCache.strokeWidth = 0;
                          return;
                        }
                        if (DefaultArticle.articleCache.strokeWidth == 12) {
                          return;
                        }
                        double b = DefaultArticle.articleCache.strokeWidth!;
                        b += 0.5;
                        DefaultArticle.articleCache.strokeWidth = b;
                      });
                    },
                    child: Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          color: Data.colorSelected),
                      child: Icon(Ionicons.add,
                          color: Color(0xFFFFFFFF), size: 28),
                    ),
                  ),
                  Space(
                    width: 10,
                  ),
                  SizedBox(
                    width: 80,
                    child: Text('${DefaultArticle.articleCache.strokeWidth!}',
                        textScaleFactor: 1.1,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Space(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (DefaultArticle.articleCache.strokeWidth == null) {
                          DefaultArticle.articleCache.strokeWidth = 0;
                          return;
                        }
                        if (DefaultArticle.articleCache.strokeWidth == 0) {
                          return;
                        }
                        double b = DefaultArticle.articleCache.strokeWidth!;
                        b -= 0.5;
                        DefaultArticle.articleCache.strokeWidth = b;
                      });
                    },
                    child: Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          color: Data.colorSelected),
                      child: Icon(Ionicons.remove,
                          color: Color(0xFFFFFFFF), size: 28),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Space(
            height: 30,
          ),
          //TODO: Notificationsystem
          //Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Checkbox(
          //                   value: DefaultArticle.articleCache.notify,
          //                   onChanged: (a) {
          //                     setState(() {
          //                       DefaultArticle.articleCache.notify = a!;
          //                     });
          //                   },
          //                   tristate: false,
          //                   activeColor: Data.colorSelected,
          //                   shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.all(Radius.circular(6)))),
          //               Text('Nutzer benachrichtigen        ',
          //                   textScaleFactor: 1.1,
          //                   style: TextStyle(fontWeight: FontWeight.w400)),
          //             ],
          //           ),
          //Space(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: DefaultArticle.articleCache.backgroundCard,
                  onChanged: (a) {
                    if (a == false) {
                      DefaultArticle.articleCache.backgroundColor = null;
                      DefaultArticle.articleCache.backgroundImage = null;
                    }
                    setState(() {
                      DefaultArticle.articleCache.backgroundCard = a!;
                    });
                  },
                  tristate: false,
                  activeColor: Data.colorSelected,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)))),
              Text('Hintergrund          ',
                  textScaleFactor: 1.1,
                  style: TextStyle(fontWeight: FontWeight.w400)),
            ],
          ),
          (DefaultArticle.articleCache.backgroundCard!
              ? BackgroundP()
              : Space()),
          Space(
            height: 16,
          ),
          (finished
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Ionicons.checkmark,
                      color: Colors.green,
                    ),
                    Space(
                      width: 10,
                    ),
                    Text('Gespeichert        ',
                        style: TextStyle(
                            color: Color(0xFF252525),
                            fontWeight: FontWeight.w500),
                        textScaleFactor: 1.2),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Ionicons.close,
                      color: Colors.redAccent,
                    ),
                    Space(
                      width: 10,
                    ),
                    Text('Unvollständig        ',
                        style: TextStyle(
                            color: Color(0xFF252525),
                            fontWeight: FontWeight.w500),
                        textScaleFactor: 1.2),
                  ],
                )),
          Space(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _createColorEntry(Color c, bool a) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: c,
          ),
        ),
        onTap: () {
          if (a) {
            setState(() {
              DefaultArticle.articleCache.textColor = c;
            });
            return;
          }
          setState(() {
            DefaultArticle.articleCache.strokeColor = c;
          });
        },
      ),
    );
  }
}
