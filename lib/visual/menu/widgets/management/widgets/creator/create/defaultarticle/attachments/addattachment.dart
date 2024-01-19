import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle/attachments/urlpicker.dart';

class AddAttachment extends StatefulWidget {
  @override
  State<AddAttachment> createState() => _AddAttachmentState();
}

class _AddAttachmentState extends State<AddAttachment> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      width: 370,
      child: Column(
        children: [
          Space(
            height: 20,
          ),
          const Center(
              child: Text(
            'Anhang hinzufügen',
            style: TextStyle(fontWeight: FontWeight.w500),
            textScaleFactor: 1.5,
          )),
          Space(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              _pickImage();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Data.colorSelected,
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  child: Icon(
                    Ionicons.camera,
                    size: 37,
                    color: Data.colorBackground,
                  ),
                ),
                const Text(
                  '   Bild auswählen',
                  style: TextStyle(fontWeight: FontWeight.w500),
                  textScaleFactor: 1.4,
                ),
              ],
            ),
          ),
          Space(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              Map<String, String>? url =
                  await UrlPicker(context: context).pick();
              if (url != null) {
                DefaultArticle.articleCache.attachmentUrls ??= [];
                DefaultArticle.articleCache.attachmentUrls!.add(url);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Data.colorSelected,
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  child: Icon(
                    Ionicons.link,
                    size: 37,
                    color: Data.colorBackground,
                  ),
                ),
                const Text(
                  '   Link hinzufügen',
                  style: TextStyle(fontWeight: FontWeight.w500),
                  textScaleFactor: 1.32,
                ),
              ],
            ),
          ),
          Space(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              Map<String, String>? url =
                  await UrlPicker(context: context).pick();
              if (url != null) {
                DefaultArticle.articleCache.attachmentAudioUrls ??= [];
                DefaultArticle.articleCache.attachmentAudioUrls!.add(url);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Data.colorSelected,
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  child: Icon(
                    Ionicons.mic,
                    size: 37,
                    color: Data.colorBackground,
                  ),
                ),
                const Text(
                  '   Audiolink einfügen',
                  style: TextStyle(fontWeight: FontWeight.w500),
                  textScaleFactor: 1.14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _pickImage() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage != null) {
      DefaultArticle.articleCache.attachmentImages ??= [];
      DefaultArticle.articleCache.attachmentImages!.add(returnedImage);
    }
  }
}
