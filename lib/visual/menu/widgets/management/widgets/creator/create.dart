import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/administration.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/createinfo.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create/defaultarticle.dart';

class CreatorCreateHub extends StatefulWidget {
  @override
  State<CreatorCreateHub> createState() => _CreatorCreateHubState();
}

class _CreatorCreateHubState extends State<CreatorCreateHub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.colorBackground,
      appBar: AppBar(
        backgroundColor: Data.colorBackground,
        foregroundColor: Data.colorText,
        elevation: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          EntryARF(
            icon: TablerIcons.hexagon_letter_i,
            iconSize: 140,
            title: 'Information',
            reversed: false,
            function: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => CreateInfo(),
                  transitionDuration: Duration(milliseconds: 100),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
          ),
          Center(
            child: Container(
              color: Data.colorText,
              width: 320,
              height: 2.5,
            ),
          ),
          EntryARF(
            icon: TablerIcons.hexagon_letter_a,
            iconSize: 140,
            title: 'Std. Artikel',
            reversed: true,
            function: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => DefaultArticle(),
                  transitionDuration: Duration(milliseconds: 100),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
