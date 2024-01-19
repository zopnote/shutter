import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/object/user/permissions.dart';
import 'package:shutter/core/visual/article/article.dart';
import 'package:shutter/core/visual/article/displaylocation.dart';
import 'package:shutter/core/visual/article/properties/children/attachments/attachmentpage.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';

import '../../data/container/data.dart';
import '../../wrapper/general/general.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  const ArticlePage(
    this.article, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAttached = false;
    int attachmentCount = 0;
    if (article.pageProperties.attachments != null) {
      if (article.pageProperties.attachments?.getImages() != null) {
        attachmentCount +=
            article.pageProperties.attachments!.getImages()!.length;
      }
      if (article.pageProperties.attachments?.getAudios() != null) {
        attachmentCount +=
            article.pageProperties.attachments!.getAudios()!.length;
      }
      if (article.pageProperties.attachments?.getURLs() != null) {
        attachmentCount +=
            article.pageProperties.attachments!.getURLs()!.length;
      }
      if (attachmentCount > 0) {
        isAttached = true;
      }
    }
    print(attachmentCount);
    print('isAttached: $isAttached');
    bool perm = false;
    if (Data.creatorID != null) {
      if (article.creatorID == Data.creatorID!) {
        perm = true;
      }
    }
    if (Data.user!.permissions == Permissions.Administrator) {
      perm = true;
    }
    return MaterialApp(
      color: Data.colorBackground,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Data.colorBackground,
          foregroundColor: Data.colorText,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Ionicons.arrow_back, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Data.colorBackground,
        body: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 30,
            ),
            perm
                ? Column(
                    children: [
                      Center(
                        child: Text(
                          'Einstellungen',
                          textScaleFactor: 2.0,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Data.colorText,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black),
                                  shadowColor:
                                      MaterialStatePropertyAll(Colors.black),
                                  elevation: MaterialStatePropertyAll(0.0001),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  ShutterDialog.showConfirmation(context,
                                      () async {
                                    await Database.article()
                                        .delete(article.articleID!);
                                    await Database.article().insert(
                                        DisplayLocation.Spotlight, article);
                                  }, true);
                                },
                                child: const Text(
                                  'Versetzung beantragen',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black),
                                  shadowColor:
                                      MaterialStatePropertyAll(Colors.black),
                                  elevation: MaterialStatePropertyAll(0.0001),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  ShutterDialog.showConfirmation(context,
                                      () async {
                                    await Database.article()
                                        .delete(article.articleID!);
                                  }, true);
                                },
                                child: const Text(
                                  'Löschen',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                : const SizedBox(),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: General().getScreenWidth() - 53,
                  child: Text(
                    article.content.title,
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
                  'von ${article.content.author}',
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Data.colorText,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 85,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 22,
                ),
                SizedBox(
                  width: General().getScreenWidth() - 56,
                  child: Text(
                    article.content.description,
                    textScaleFactor: 1.55,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Data.colorText,
                    ),
                  ),
                ),
              ],
            ),
            Column(
                children: isAttached
                    ? [
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 22,
                            ),
                            SizedBox(
                              child: Text(
                                '($attachmentCount)',
                                textScaleFactor: 1.7,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Data.colorText,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.attach_file_rounded,
                              size: 25,
                              color: Data.colorText,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                    Data.colorSelected),
                                foregroundColor: MaterialStatePropertyAll(
                                    Data.colorSelected),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AttachmentPage(
                                        article.pageProperties.attachments!),
                                  ),
                                );
                              },
                              child: Text(
                                'Anzeigen',
                                textScaleFactor: 1.2,
                                style: TextStyle(
                                  color: Data.colorText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]
                    : []),
            const SizedBox(
              height: 75,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 22,
                ),
                SizedBox(
                  width: General().getScreenWidth() - 58,
                  child: Text(
                    article.content.contentText,
                    textScaleFactor: 1.55,
                    style: TextStyle(
                      color: Data.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
