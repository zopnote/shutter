import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class ObjectAdapter {
  static MemoryImage MemoryImageBy(Uint8List? blob) {
    Uint8List? image = blob;
    return MemoryImage(image!);
  }
}
