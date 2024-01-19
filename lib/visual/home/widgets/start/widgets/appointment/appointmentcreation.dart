import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/main.dart';
import 'package:shutter/visual/home/widgets/start/widgets/appointments.dart';

class AppointmentCreation extends StatefulWidget {
  const AppointmentCreation({super.key});

  @override
  State<AppointmentCreation> createState() => _AppointmentCreationState();
}

class _AppointmentCreationState extends State<AppointmentCreation> {
  TextEditingController nameTextFieldController = TextEditingController();
  TextEditingController keyTextFieldController = TextEditingController();
  IconData iconData = TablerIcons.calendar_time;
  Color color = const Color(0xFF3E4579);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
          top: Radius.circular(50),
        ),
      ),
      backgroundColor: MaterialStateColor.resolveWith(
        (states) => const Color(0xFFFFFFFF),
      ),
      content: SizedBox(
        height: 550,
        width: double.maxFinite,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 43,
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
                  width: 215,
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
            const SizedBox(
              height: 20,
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
                  width: 230,
                  height: 35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _createColorEntry(const Color(0xFF3E4579)),
                      _createColorEntry(const Color(0xFFB92065)),
                      _createColorEntry(const Color(0xFF797FA2)),
                      _createColorEntry(const Color(0xFFC5A455)),
                      _createColorEntry(const Color(0xFF4782B2)),
                      _createColorEntry(const Color(0xFFCC4040)),
                      _createColorEntry(const Color(0xFF7F7CD2)),
                      _createColorEntry(const Color(0xFF76A154)),
                      _createColorEntry(const Color(0xFF8E50A4)),
                      _createColorEntry(const Color(0xFF99A146)),
                      _createColorEntry(const Color(0xFFBE963B)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 230,
              child: Center(
                child: TextField(
                  maxLength: 28,
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
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 230,
              child: Center(
                child: Align(
                  alignment: const Alignment(0, 2),
                  child: TextField(
                    maxLength: 47,
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
            const SizedBox(
              height: 30,
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
                onPressed: () {
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
                  Appointments().addAppointments(nameTextFieldController.text,
                      keyTextFieldController.text, color, iconData);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PageLogic(),
                    ),
                  );
                },
                child: Text(
                  'Klicke zum erstellen',
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
}
