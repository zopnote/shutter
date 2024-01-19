import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle.dart';

class DAPage extends StatefulWidget {
  @override
  State<DAPage> createState() => _DAPageState();
}

class _DAPageState extends State<DAPage> {
  static TextEditingController? contentController;

  @override
  void initState() {
    contentController ??= TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool savedContent = false;
    bool moreContent = true;
    if (DefaultArticle.articleCache.content != null &&
        DefaultArticle.articleCache.content == contentController!.text &&
        DefaultArticle.articleCache.content != '') {
      savedContent = true;
    }
    if (contentController!.text.length > 19) {
      moreContent = false;
    }
    bool finished = false;
    if (savedContent && !moreContent) {
      finished = true;
    }
    DefaultArticle.finishedContent = finished;
    return SizedBox(
      child: Column(
        children: [
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
                    maxLength: 1300,
                    maxLines: 50,
                    minLines: 1,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: contentController,
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
                      labelText: ' Inhaltstext (min. 20)',
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
                      savedContent ? Ionicons.checkmark : Ionicons.save,
                      color: Color(0xFFFFFFFF),
                      size: 20,
                    )),
                onTap: () {
                  if (DefaultArticle.articleCache.content != null &&
                      DefaultArticle.articleCache.content ==
                          contentController!.text) {
                    return;
                  }
                  DefaultArticle.articleCache.content = contentController!.text;
                  setState(() {});
                },
              ),
            ],
          ),
          Space(
            height: 20,
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
            height: 28,
          ),
        ],
      ),
    );
  }
}
