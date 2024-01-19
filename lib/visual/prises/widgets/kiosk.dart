import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shutter/visual/prises/widgets/kiosk/widgets/drinks.dart';
import 'package:shutter/visual/prises/widgets/kiosk/widgets/food.dart';
import 'package:shutter/visual/prises/widgets/kiosk/widgets/ice.dart';
import 'package:vibration/vibration.dart';

import '../../../core/data/container/data.dart';
import '../../../core/wrapper/general/general.dart';

class Kiosk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Icon(TablerIcons.arrow_back, size: 40),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Food(),
                const SizedBox(
                  height: 40,
                ),
                Drinks(),
                const SizedBox(
                  height: 40,
                ),
                Ice(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
