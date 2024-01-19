import 'package:flutter/cupertino.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shutter/core/visual/listinfo/listinfo.dart';

class ListInfoContainer {
  static ListInfo nothing = ListInfo(
      color: const Color(0xFF3E4579),
      icon: TablerIcons.x,
      title: 'Nichts.',
      description: 'Momentan keine Neuigkeiten.');
  static List<ListInfo> infos = [];
  static List<Widget> infoEntry = [];
}
