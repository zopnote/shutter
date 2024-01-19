import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/linkmanager.dart';

import 'attachment.dart';

class AttachmentUrl extends Attachment {
  final String url;
  final IconData icon;
  final String name;

  AttachmentUrl({
    Key? key,
    required this.name,
    required this.url,
    required this.icon,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'icon': '${icon.fontPackage!}:${icon.fontFamily!}',
    };
  }

  @override
  State<AttachmentUrl> createState() => _AttachmentUrlState();
}

class _AttachmentUrlState extends State<AttachmentUrl> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: 121,
                width: 121,
                child: Column(
                  children: [
                    Icon(
                      widget.icon,
                      color: Data.colorText,
                      size: 40,
                    ),
                    Text(
                      widget.name,
                      textScaleFactor: 1.4,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Data.colorText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)))),
                fixedSize: MaterialStatePropertyAll(Size(95, 95)),
                surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              onPressed: () {
                WebManager().open(widget.url, context);
              },
              child: const Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
