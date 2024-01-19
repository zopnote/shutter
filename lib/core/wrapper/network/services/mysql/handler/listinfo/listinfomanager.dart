import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shutter/core/visual/listinfo/listinfo.dart';

class ListInfoManager {
  static ListInfo generateListInfo(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final IconData icon = IconData(jsonMap['icon'],
        fontFamily: 'tabler-icons', fontPackage: 'flutter_tabler_icons');
    final String title = jsonMap['title'];
    final String description = jsonMap['description'];
    final Color color = Color(jsonMap['color']);
    final String infoID = jsonMap['infoID'];
    final String creatorID = jsonMap['creatorID'];
    return ListInfo(
      color: color,
      icon: icon,
      title: title,
      description: description,
      creatorID: creatorID,
      infoID: infoID,
    );
  }
}
