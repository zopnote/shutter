import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shutter/visual/prises/widgets/cafeteria/widgets/friday.dart';
import 'package:shutter/visual/prises/widgets/cafeteria/widgets/monday.dart';
import 'package:shutter/visual/prises/widgets/cafeteria/widgets/thursday.dart';
import 'package:shutter/visual/prises/widgets/cafeteria/widgets/tuesday.dart';
import 'package:shutter/visual/prises/widgets/cafeteria/widgets/wednesday.dart';
import 'package:vibration/vibration.dart';

import '../../../core/data/container/data.dart';
import '../../../core/wrapper/general/general.dart';

class Cafeteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (Data.activeVibration) {
              Vibration.vibrate(duration: 120);
            }
            Navigator.pop(context);
          },
          backgroundColor: Data.colorSelected,
          child: const Align(
            alignment: Alignment(0, -0.2),
            child: Icon(TablerIcons.arrow_forward, size: 40),
          ),
        ),
        backgroundColor: Data.colorBackground,
        body: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Container(
              width: General().getScreenWidth() - 35,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Monday(),
                  const SizedBox(
                    height: 40,
                  ),
                  Tuesday(),
                  const SizedBox(
                    height: 40,
                  ),
                  Wednesday(),
                  const SizedBox(
                    height: 40,
                  ),
                  Thursday(),
                  const SizedBox(
                    height: 40,
                  ),
                  Friday(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
