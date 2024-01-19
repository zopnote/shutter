import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/core/wrapper/general/Timer.dart';
import 'package:shutter/core/wrapper/network/services/mysql/DataBase.dart';
import 'package:shutter/core/wrapper/network/services/youtube/client.dart';
import 'package:shutter/visual/music/widgets/SongList.dart';
import 'package:shutter/visual/music/widgets/rowbuttons.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  bool searched = false;
  static late String imageUrl;
  static late String title;

  TextEditingController textFieldController = TextEditingController();

  Future<void> getSongTitles(String songTitle) async {
    if (await ShutterTimer.get() == 0) {
      Map<String, String> information = await YouTube.searchVideo(songTitle);
      setState(() {
        imageUrl = information['thumbnail']!;
        title = information['title']!;
        searched = true;
      });
    } else {
      double time = await ShutterTimer.get() / 3600000;
      ShutterDialog.show(context,
          'Du kannst nur alle 5 Tage einen Wunsch abgeben. Verbleibende Zeit: ${double.parse((time).toStringAsFixed(1))} Stunden');
    }
  }

  double getScreenWidth() {
    final screenWidth = WidgetsBinding.instance.window.physicalSize.width;
    final devicePixelRatio = WidgetsBinding.instance.window.devicePixelRatio;
    return screenWidth / devicePixelRatio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.colorBackground,
      body: Center(
        child: SizedBox(
          width: 370,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(
                height: 30,
              ),
              (Data.activeAnimations
                  ? LottieBuilder.asset(
                      'assets/animations/youtube.json',
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                    )
                  : Icon(
                      TablerIcons.brand_youtube,
                      size: 160,
                    )),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Center(
                        child: SizedBox(
                          width: 320,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Data.colorSelected, width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: textFieldController,
                                    textAlignVertical:
                                        const TextAlignVertical(y: -0.65),
                                    style: TextStyle(
                                        color: Data.colorText, fontSize: 13),
                                    textAlign: TextAlign.start,
                                    cursorColor: Data.colorText,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hoverColor: Data.colorText,
                                      labelText: ' Suche auf YouTube',
                                      labelStyle: TextStyle(
                                        color: Data.colorText,
                                        backgroundColor: Data.colorBackground,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      getSongTitles(textFieldController.text);
                                    },
                                    style: ButtonStyle(
                                      splashFactory: InkRipple.splashFactory,
                                      overlayColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Data.colorSelected),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.transparent),
                                      shadowColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.transparent),
                                    ),
                                    child: Align(
                                      alignment: const Alignment(0, -0.2),
                                      child: Icon(TablerIcons.search,
                                          color: Data.colorText, size: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: searched
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 300,
                            width: 165,
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Data.colorBackground,
                                          width: 5)),
                                  foregroundDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Data.colorBackground,
                                          width: 5)),
                                  child: Image.network(
                                    width: 50,
                                    imageUrl,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Data.colorBackground,
                                            width: 5)),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(title,
                                          style: TextStyle(
                                              color: Data.colorText,
                                              fontWeight: FontWeight.bold),
                                          textScaleFactor: 0.85,
                                          textAlign: TextAlign.center),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                height: 60,
                                alignment: Alignment.bottomRight,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Data.colorBackground, width: 5)),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (await ShutterTimer.use()) {
                                      Database.song().save(title);
                                      ShutterDialog.show(context,
                                          'Danke für das Einreichen. In 5 Tagen kannst du deinen nächsten Wunsch abgeben.');
                                    } else {
                                      double time =
                                          await ShutterTimer.get() / 3600000;
                                      ShutterDialog.show(context,
                                          'Du kannst alle 5 Tage einen Wunsch abgeben. Verbleibende Zeit: ${double.parse((time).toStringAsFixed(1))} Stunden');
                                    }
                                  },
                                  style: ButtonStyle(
                                    splashFactory: InkRipple.splashFactory,
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Data.colorSelected),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.transparent),
                                    shadowColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.transparent),
                                  ),
                                  child: Align(
                                    alignment: const Alignment(0, -0.2),
                                    child: Stack(
                                      children: [
                                        Align(
                                            alignment: Alignment(0, 0.9),
                                            child: Text(
                                              'Senden',
                                              style: TextStyle(
                                                  color: Data.colorText),
                                            )),
                                        Icon(
                                            TablerIcons
                                                .arrow_big_right_line_filled,
                                            color: Data.colorText,
                                            size: 30),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: SizedBox(
                                child: Icon(
                              TablerIcons.search,
                              color: Data.colorText,
                              size: 40,
                            )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: SizedBox(
                              child: Text(
                                'Hier wird deine Suche angezeigt.',
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.2,
                                style: TextStyle(
                                    color: Data.colorText,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              const InformationButtons(),
              Space(height: 25),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Top Songs',
                    textScaleFactor: 2.2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Data.colorText,
                    ),
                  ),
                  (Data.activeAnimations
                      ? LottieBuilder.asset(
                          'assets/animations/dot_rotating.json',
                          height: 45,
                          width: 45,
                          repeat: true)
                      : SizedBox()),
                ],
              ),
              Space(height: 10),
              SizedBox(height: 480, child: Songlist()),
            ],
          ),
        ),
      ),
    );
  }
}
