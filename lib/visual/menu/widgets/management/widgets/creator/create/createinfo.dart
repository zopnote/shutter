import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/listinfo/listinfo.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:shutter/visual/startup/articlepolicy.dart';

import '../../../../../../../core/visual/shutterdialog.dart';

class CreateInfo extends StatefulWidget {
  @override
  State<CreateInfo> createState() => _CreateInfoState();
}

class _CreateInfoState extends State<CreateInfo> {
  TextEditingController nameTextFieldController = TextEditingController();
  TextEditingController keyTextFieldController = TextEditingController();
  IconData iconData = TablerIcons.calendar_time;
  Color color = const Color(0xFF3E4579);
  bool notify = false;
  bool yes = false;

  IconButton _createIconEntry(IconData icon) {
    return IconButton(
      splashRadius: 1,
      onPressed: () {
        setState(() {
          iconData = icon;
        });
      },
      style: const ButtonStyle(
        maximumSize: MaterialStatePropertyAll(Size(35, 35)),
        fixedSize: MaterialStatePropertyAll(Size(35, 35)),
      ),
      icon: Icon(
        icon,
        color: const Color(0xFF414141),
      ),
    );
  }

  ElevatedButton _createColorEntry(Color color) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          this.color = color;
        });
      },
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        shadowColor: MaterialStatePropertyAll(Colors.transparent),
        maximumSize: MaterialStatePropertyAll(Size(64, 64)),
        fixedSize: MaterialStatePropertyAll(Size(64, 64)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.colorBackground,
      appBar: AppBar(
        title: const Text('\nInformation erstellen',
            textScaleFactor: 1.2,
            style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
        backgroundColor: Data.colorBackground,
        foregroundColor: Data.colorText,
        elevation: 0,
      ),
      body: SizedBox(
        height: 690,
        width: double.maxFinite,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Space(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Icon:  ',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF414141),
                  ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFF414141), width: 3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Align(
                    alignment: const Alignment(0, -0.6),
                    child: Icon(
                      iconData,
                      color: const Color(0xFF414141),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 315,
                  height: 35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _createIconEntry(TablerIcons.calendar_time),
                      _createIconEntry(TablerIcons.alarm_plus),
                      _createIconEntry(Ionicons.analytics),
                      _createIconEntry(TablerIcons.notes),
                      _createIconEntry(TablerIcons.pencil_plus),
                      _createIconEntry(TablerIcons.book),
                      _createIconEntry(TablerIcons.access_point),
                      _createIconEntry(TablerIcons.atom),
                      _createIconEntry(TablerIcons.ball_football),
                      _createIconEntry(TablerIcons.music),
                      _createIconEntry(TablerIcons.cookie),
                      _createIconEntry(TablerIcons.camera),
                      _createIconEntry(TablerIcons.alert_hexagon),
                      _createIconEntry(TablerIcons.abc),
                      _createIconEntry(TablerIcons.math),
                      _createIconEntry(TablerIcons.history),
                      _createIconEntry(TablerIcons.microphone),
                      _createIconEntry(TablerIcons.headset),
                    ],
                  ),
                ),
              ],
            ),
            Space(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Farbe:  ',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF414141),
                  ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFF414141), width: 3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Align(
                    alignment: const Alignment(0, -0.6),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 360,
                  height: 35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _createColorEntry(Data.colorSelected),
                      _createColorEntry(const Color(0xFF3E4579)),
                      _createColorEntry(const Color(0xFF9C4DA1)),
                      _createColorEntry(const Color(0xFF797FA2)),
                      _createColorEntry(const Color(0xFFCEB471)),
                      _createColorEntry(const Color(0xFF5E89AB)),
                      _createColorEntry(const Color(0xFFA15D5D)),
                      _createColorEntry(const Color(0xFFABB96D)),
                      _createColorEntry(const Color(0xFF6D944E)),
                      _createColorEntry(const Color(0xFF8850A4)),
                      _createColorEntry(const Color(0xFF99A146)),
                      _createColorEntry(const Color(0xFF9F603D)),
                      _createColorEntry(const Color(0xFFCC2F2F)),
                    ],
                  ),
                ),
              ],
            ),
            Space(
              height: 55,
            ),
            Center(
              child: SizedBox(
                width: 260,
                child: Center(
                  child: TextField(
                    maxLength: 27,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: nameTextFieldController,
                    textAlignVertical: const TextAlignVertical(y: -0.65),
                    style:
                        const TextStyle(color: Color(0xFF414141), fontSize: 16),
                    textAlign: TextAlign.start,
                    cursorColor: const Color(0xFF414141),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF414141),
                            width:
                                2), // Farbe des unteren Strichs im normalen Zustand
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF7F7CD2),
                            width:
                                2), // Farbe des unteren Strichs im fokussierten Zustand
                      ),
                      hoverColor: Color(0xFF414141),
                      labelText: ' Titel',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF414141),
                        backgroundColor: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 260,
                child: Center(
                  child: Align(
                    alignment: const Alignment(0, 2),
                    child: TextField(
                      maxLength: 40,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      cursorColor: const Color(0xFF414141),
                      keyboardType: TextInputType.text,
                      controller: keyTextFieldController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF414141),
                              width:
                                  2), // Farbe des unteren Strichs im normalen Zustand
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF7F7CD2),
                              width:
                                  2), // Farbe des unteren Strichs im fokussierten Zustand
                        ),
                        focusColor: Color(0xFF414141),
                        hoverColor: Color(0xFF414141),
                        labelText: ' Beschreibung',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF414141),
                          backgroundColor: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //TODO: Notificationsystem
            //Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Checkbox(value: notify, onChanged: (a) {setState(() {
            //                   notify = a!;
            //                 });}, tristate: false, activeColor: Data.colorSelected,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6)))),
            //                 Text('Nutzer benachrichtigen', textScaleFactor: 1.1, style: TextStyle(fontWeight: FontWeight.w400)),
            //               ],
            //             ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: yes,
                    onChanged: (a) {
                      setState(() {
                        yes = a!;
                      });
                    },
                    tristate: false,
                    activeColor: Data.colorSelected,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
                const Text('Ich bin mit der '),
                GestureDetector(
                  child: const Text('DSGVO-A',
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                      )),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ArticlePolicy().build(context);
                    }));
                  },
                ),
                const Text(' einverstanden.'),
              ],
            ),
            Space(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Data.colorSelected),
                    elevation: const MaterialStatePropertyAll(0),
                    fixedSize: const MaterialStatePropertyAll(Size(215, 60)),
                    maximumSize: const MaterialStatePropertyAll(Size(215, 40)),
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))))),
                onPressed: () async {
                  if (keyTextFieldController.text.length < 5) {
                    ShutterDialog.show(context,
                        'Du musst mindestens 5 Zeichen in der Beschreibung angeben.');
                    if (nameTextFieldController.text.length < 5) {
                      ShutterDialog.show(context,
                          'Du musst mindestens 5 Zeichen im Titel angeben.');

                      return;
                    }
                    return;
                  }
                  if (nameTextFieldController.text.length < 5) {
                    ShutterDialog.show(context,
                        'Du musst mindestens 5 Zeichen im Titel angeben.');

                    return;
                  }
                  if (!yes) {
                    ShutterDialog.show(context,
                        'Akzeptiere die Datenschutzerklärung bezüglich der Sammlung deiner Daten bei der Erstellung von Inhalten.');

                    return;
                  }
                  Navigator.pop(context);
                  ShutterDialog.show(context,
                      'Danke dass du einen Inhalt erstellt hast. Er wird nun von unserem Team begutachtet und ggf. veröffentlicht.');
                  await Database.listInfo().insert(ListInfo(
                      color: color,
                      icon: iconData,
                      title: nameTextFieldController.text,
                      description: keyTextFieldController.text,
                      creatorID: Data.creatorID));
                  return;
                },
                child: Text(
                  'Klicke zum abschicken',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Data.colorBackground,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
