import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shutter/core/visual/article/properties/children/attachments/children/attachment.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';

class AttachmentImage extends Attachment {
  final String imageAdress;
  final String name;

  AttachmentImage({
    required this.name,
    required this.imageAdress,
  });

  @override
  String getName() {
    return name;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': imageAdress,
    };
  }

  @override
  State<AttachmentImage> createState() => _AttachmentImageState();
}

class _AttachmentImageState extends State<AttachmentImage> {
  Future<void> load() async {
    Blob? blob = await Database.image().get(widget.imageAdress);

    if (blob != null) {
      final List<int> bytes = blob.toBytes();

      setState(() {
        image = MemoryImage(Uint8List.fromList(bytes));
      });
    }
  }

  MemoryImage? image;

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: LottieBuilder.asset('assets/animations/loading.json'),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Image(image: image!),
    );
  }
}
