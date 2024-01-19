import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/create.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/deactive.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/library.dart';
import 'package:vibration/vibration.dart';

import 'creator/settingscreator.dart';

class CreatorPage extends StatefulWidget {
  CreatorPage({super.key});

  @override
  State<CreatorPage> createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (Data.creatorID == null) {
      return CreatorDeactive();
    }
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          backgroundColor: Data.colorBackground,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [_buildAppBar()];
            },
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  height: 90,
                  width: 200,
                  foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset('assets/creatorhub.png').image)),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LottieBuilder.asset(
                        'assets/animations/diagram_widget.json',
                        height: 200,
                        width: 200,
                        frameRate: FrameRate.max,
                        repeat: false,
                        reverse: true,
                      ),
                      AnimatedTextKit(
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        animatedTexts: [
                          RotateAnimatedText('Erstelle',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          RotateAnimatedText('Informiere',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          RotateAnimatedText('Präsentiere',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          RotateAnimatedText('Artikel',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          RotateAnimatedText('Nachrichten',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          RotateAnimatedText('Ereignisse',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          RotateAnimatedText('Bilder',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          RotateAnimatedText('Projekte',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Center(
                  child: Icon(Ionicons.arrow_down, size: 50),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text('Bilbiothek',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black),
                                shadowColor: MaterialStatePropertyAll(
                                    Colors.black),
                                elevation: MaterialStatePropertyAll(0.0001),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        CreatorLibraryHub(),
                                    transitionDuration:
                                        const Duration(milliseconds: 100),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                  ),
                                );
                                if (Data.activeVibration) {
                                  Vibration.vibrate(duration: 50);
                                }
                              },
                              child: const Text(
                                'Klicke zum öffnen',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                      LottieBuilder.asset(
                        'assets/animations/library_widget.json',
                        height: 200,
                        width: 200,
                        frameRate: FrameRate.max,
                        repeat: false,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LottieBuilder.asset(
                        'assets/animations/create_widget.json',
                        height: 210,
                        width: 210,
                        frameRate: FrameRate.max,
                        repeat: true,
                      ),
                      Column(
                        children: [
                          const Text('Erstellen',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black),
                                shadowColor: MaterialStatePropertyAll(
                                    Colors.black),
                                elevation: MaterialStatePropertyAll(0.0001),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        CreatorCreateHub(),
                                    transitionDuration:
                                        const Duration(milliseconds: 100),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                  ),
                                );
                                if (Data.activeVibration) {
                                  Vibration.vibrate(duration: 50);
                                }
                              },
                              child: const Text(
                                'Klicke zum öffnen',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      leadingWidth: 260,
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => SettingsCreator(),
              transitionDuration: const Duration(milliseconds: 30),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ),
          );
          if (Data.activeVibration) {
            Vibration.vibrate(duration: 50);
          }
        },
        child: Column(
          children: [
            Space(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Space(
                  width: 14,
                ),
                Icon(
                  TablerIcons.user_cog,
                  size: 34,
                  color: Data.colorBackground,
                ),
                Space(
                  width: 15,
                ),
                Text(
                  'Creatoreinstellungen',
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Data.colorBackground,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Data.colorSelected,
      expandedHeight: 85,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(23),
        ),
      ),
    );
  }
}
