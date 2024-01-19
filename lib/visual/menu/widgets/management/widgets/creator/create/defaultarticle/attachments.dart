import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/listinfo/listinfo.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle/attachments/addattachment.dart';

class DAAttachments extends StatefulWidget {
  @override
  State<DAAttachments> createState() => _DAAttachmentsState();
}

class _DAAttachmentsState extends State<DAAttachments> {
  @override
  Widget build(BuildContext context) {
    List<Widget> attachmentEntry = [];
    int count = 0;
    if (DefaultArticle.articleCache.attachmentImages != null) {
      for (XFile file in DefaultArticle.articleCache.attachmentImages!) {
        attachmentEntry.add(_obj(file));
      }
    }

    if (DefaultArticle.articleCache.attachmentAudioUrls != null) {
      for (Map<String, String>? audio
          in DefaultArticle.articleCache.attachmentAudioUrls!) {
        String description = '';
        if (audio!.values.first.length > 30) {
          description = '${audio.values.first.substring(0, 28)}...';
        } else {
          description = audio.values.first;
        }
        attachmentEntry.add(ListInfo(
                color: Data.colorSelected,
                icon: Ionicons.mic,
                title: audio.keys.first,
                description: '$description')
            .createEntry());
      }
    }

    if (DefaultArticle.articleCache.attachmentUrls != null) {
      for (Map<String, String>? url
          in DefaultArticle.articleCache.attachmentUrls!) {
        String description = '';
        if (url!.values.first.length > 30) {
          description = '${url.values.first.substring(0, 28)}...';
        } else {
          description = url.values.first;
        }
        attachmentEntry.add(ListInfo(
                color: Data.colorSelected,
                icon: Ionicons.link,
                title: url.keys.first,
                description: '$description')
            .createEntry());
      }
    }

    if (attachmentEntry.isEmpty) {
      attachmentEntry.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            'assets/animations/cat.json',
            height: 120,
          ),
          Space(
            width: 30,
          ),
          Text(
            'Zeroo... o.O',
            style:
                TextStyle(color: Data.colorText, fontWeight: FontWeight.w500),
          ),
        ],
      ));
    } else {
      count = attachmentEntry.length;
    }
    bool addAble = false;
    if (attachmentEntry.length < 10) {
      addAble = true;
    }
    return SizedBox(
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  width: 320,
                  decoration: const BoxDecoration(
                      color: Color(0xFFE3E3E3),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      Space(
                        height: 60,
                      ),
                      Column(
                        children: attachmentEntry,
                      ),
                      Space(
                        height: 15,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 130,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Data.colorSelected,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(17)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.refresh_rounded,
                                      color: Data.colorBackground,
                                    ),
                                    Text(
                                      ' Neuladen',
                                      style: TextStyle(
                                          color: Data.colorBackground,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Space(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (DefaultArticle
                                            .articleCache.attachmentUrls !=
                                        null) {
                                      DefaultArticle
                                          .articleCache.attachmentUrls!
                                          .clear();
                                    }
                                    if (DefaultArticle
                                            .articleCache.attachmentAudioUrls !=
                                        null) {
                                      DefaultArticle
                                          .articleCache.attachmentAudioUrls!
                                          .clear();
                                    }
                                    if (DefaultArticle
                                            .articleCache.attachmentImages !=
                                        null) {
                                      DefaultArticle
                                          .articleCache.attachmentImages!
                                          .clear();
                                    }
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Data.colorSelected,
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(17)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        color: Data.colorBackground,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Space(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Data.colorSelected,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$count/9 Anhängen',
                        style: TextStyle(
                            color: Data.colorBackground,
                            fontWeight: FontWeight.w500),
                      ),
                      Space(
                        width: 15,
                      ),
                      (addAble
                          ? GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.add_rounded,
                                    color: Data.colorBackground,
                                  ),
                                  Text(
                                    'Anhang',
                                    style: TextStyle(
                                        color: Data.colorBackground,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              onTap: () {
                                ShutterDialog.showObject(
                                    context, AddAttachment());
                              },
                            )
                          : Space()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _obj(XFile image) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          const SizedBox(
            width: 18,
          ),
          Container(
            height: 58,
            width: 108,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Data.colorSelected,
            ),
            child: Align(
              alignment: const Alignment(0, -0.1),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.file(File(image.path)),
              ),
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '  Bildanhang',
                textScaleFactor: 1.4,
                style: TextStyle(
                    color: Color(0xFF414141), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
