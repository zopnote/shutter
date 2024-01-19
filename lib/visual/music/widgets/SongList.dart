import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/listinfo/listinfo.dart';
import 'package:shutter/core/wrapper/network/services/mysql/DataBase.dart';

class Songlist extends StatefulWidget {
  @override
  State<Songlist> createState() => _SonglistState();
}

class _SonglistState extends State<Songlist> {
  static Map<String, int>? songs;

  Future<void> load() async {
    if (songs == null) {
      songs = await Database.song().fetch();
      setState(() {});
    }
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (songs == null) {
      return SizedBox(
        width: 320,
        height: 410,
        child: Center(
          child: Data.activeAnimations
              ? LottieBuilder.asset('assets/animations/loading.json')
              : Center(
                  child: Column(
                    children: [
                      Space(
                        height: 15,
                      ),
                      Text('Lade Daten...',
                          style: TextStyle(
                              color: Data.colorText,
                              fontWeight: FontWeight.w500,
                              fontSize: 23)),
                    ],
                  ),
                ),
        ),
      );
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        if (songs!.length < index + 1) {
          return const SizedBox(
            height: 5,
          );
        }
        if (songs!.keys.elementAt(index).length < 40) {
          return ListInfo(
                  color: colors.elementAt(index),
                  icon: icons.elementAt(index),
                  title: '${songs!.values.elementAt(index)} Stimmen',
                  description: songs!.keys.elementAt(index))
              .createEntry();
        }
        String desc = (songs!.keys.elementAt(index).substring(0, 37)) + "...";
        return ListInfo(
                color: colors.elementAt(index),
                icon: icons.elementAt(index),
                title: '${songs!.values.elementAt(index)} Stimmen',
                description: desc)
            .createEntry();
      },
    );
  }

  static List<Color> colors = [
    const Color(0xFF47B29D),
    const Color(0xFF7E2BD3),
    const Color(0xFFA15342),
    const Color(0xFF8F326F),
    Data.colorSelected,
    Data.colorSelected,
    Data.colorSelected,
    Data.colorSelected,
    Data.colorSelected,
    Data.colorSelected,
  ];
  static List<IconData> icons = [
    Ionicons.trophy,
    Ionicons.cloud,
    Ionicons.headset,
    Ionicons.extension_puzzle,
    Ionicons.cube,
    Ionicons.cube,
    Ionicons.cube,
    Ionicons.cube,
    Ionicons.cube,
    Ionicons.cube,
  ];
}
