import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/visual/prises/widgets/cafeteria.dart';
import 'package:shutter/visual/prises/widgets/kiosk.dart';
import 'package:vibration/vibration.dart';

class PriceButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 180,
          height: 60,
          child: ElevatedButton(
            style: ButtonStyle(
                shadowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent),
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Data.colorSelected),
                splashFactory: InkRipple.splashFactory,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        side: BorderSide.none))),
            onPressed: () {
              if (Data.activeVibration) {
                Vibration.vibrate(duration: 120);
              }
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: Kiosk(),
                      duration: const Duration(milliseconds: 500)));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Ionicons.newspaper,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Kiosk',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.3,
                    style: TextStyle(color: Color(0xFFFFFFFF))),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        SizedBox(
          width: 180,
          height: 60,
          child: ElevatedButton(
            style: ButtonStyle(
                shadowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent),
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Data.colorSelected),
                splashFactory: InkRipple.splashFactory,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        side: BorderSide.none))),
            onPressed: () {
              if (Data.activeVibration) {
                Vibration.vibrate(duration: 120);
              }
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: Cafeteria(),
                      duration: const Duration(milliseconds: 500)));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Ionicons.cafe,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Cafeteria',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.3,
                    style: TextStyle(color: Color(0xFFFFFFFF))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
