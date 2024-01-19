import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/settings.dart';

class Xperience extends StatefulWidget {
  @override
  State<Xperience> createState() => _XperienceState();
}

class _XperienceState extends State<Xperience> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Erfahrung',
                textScaleFactor: 2.0,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF414141),
                ),
              ),
            ],
          ),
          Align(
            alignment: const Alignment(0, 1.1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sounds',
                  style: TextStyle(
                    color: Color(0xFF414141),
                  ),
                  textScaleFactor: 1.3,
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    splashRadius: 18,
                    onPressed: () {
                      if (Data.activeSound) {
                        Settings.sounds(false);
                        setState(() {});
                        return;
                      }
                      Settings.sounds(true);
                      setState(() {});
                      return;
                    },
                    icon: Icon(Data.activeSound
                        ? Ionicons.checkmark
                        : Ionicons.close)),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Vibrationen',
                  style: TextStyle(
                    color: Color(0xFF414141),
                  ),
                  textScaleFactor: 1.3,
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    splashRadius: 18,
                    onPressed: () {
                      if (Data.activeVibration) {
                        Settings.vibrations(false);
                        setState(() {});
                        return;
                      }
                      Settings.vibrations(true);
                      setState(() {});
                      return;
                    },
                    icon: Icon(Data.activeVibration
                        ? Ionicons.checkmark
                        : Ionicons.close)),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.08),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Qualitätsmodus',
                  style: TextStyle(
                    color: Color(0xFF414141),
                  ),
                  textScaleFactor: 1.3,
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    splashRadius: 18,
                    onPressed: () {
                      if (Data.activeAnimations) {
                        Settings.animations(false);
                        setState(() {});
                        return;
                      }
                      Settings.animations(true);
                      setState(() {});
                      return;
                    },
                    icon: Icon(Data.activeAnimations
                        ? Ionicons.checkmark
                        : Ionicons.close)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
