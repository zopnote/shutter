import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:shutter/visual/startup/privacypolicy.dart';
import 'package:uuid/uuid.dart';

class DefaultMsg extends StatefulWidget {
  @override
  State<DefaultMsg> createState() => _DefaultMsgState();
}

class _DefaultMsgState extends State<DefaultMsg> {
  TextEditingController? textEditingController;
  int index = 0;
  String reason = '';
  String piece = '';
  String mail = '';

  @override
  void dispose() {
    textEditingController = null;
    super.dispose();
  }

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if (index == 0) {
      return SizedBox(
        height: 260,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nenne deinen Grund',
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Color(0xFF2A2A2A),
                fontWeight: FontWeight.bold,
              ),
            ),
            Space(
              height: 15,
            ),
            Center(
              child: SizedBox(
                width: 250,
                child: TextField(
                  onChanged: (s) {
                    setState(() {});
                  },
                  maxLength: 40,
                  maxLines: 20,
                  minLines: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: textEditingController,
                  textAlignVertical: const TextAlignVertical(y: -0.65),
                  style:
                      const TextStyle(color: Color(0xFF414141), fontSize: 16),
                  textAlign: TextAlign.start,
                  cursorColor: const Color(0xFF414141),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF414141), width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF7F7CD2), width: 2),
                    ),
                    hoverColor: Color(0xFF414141),
                    labelText: ' Grund zur Anfrage',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                      backgroundColor: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
            Space(
              height: 10,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  shadowColor: MaterialStatePropertyAll(Colors.black),
                  elevation: MaterialStatePropertyAll(0.0001),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                onPressed: () async {
                  reason = textEditingController!.text;
                  textEditingController = TextEditingController();
                  setState(() {
                    index++;
                  });
                },
                child: const Text(
                  'Weiter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      );
    }
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if (index == 1) {
      return SizedBox(
        height: 260,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Um welchen Teil unserer Plattform geht es?',
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Color(0xFF2A2A2A),
                fontWeight: FontWeight.bold,
              ),
            ),
            Space(
              height: 15,
            ),
            Center(
              child: SizedBox(
                width: 250,
                child: TextField(
                  onChanged: (s) {
                    setState(() {});
                  },
                  maxLength: 36,
                  maxLines: 20,
                  minLines: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: textEditingController,
                  textAlignVertical: const TextAlignVertical(y: -0.65),
                  style:
                      const TextStyle(color: Color(0xFF414141), fontSize: 16),
                  textAlign: TextAlign.start,
                  cursorColor: const Color(0xFF414141),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF414141), width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF7F7CD2), width: 2),
                    ),
                    hoverColor: Color(0xFF414141),
                    labelText: ' Teil der App',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                      backgroundColor: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
            Space(
              height: 10,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  shadowColor: MaterialStatePropertyAll(Colors.black),
                  elevation: MaterialStatePropertyAll(0.0001),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                onPressed: () async {
                  piece = textEditingController!.text;
                  textEditingController = TextEditingController();
                  setState(() {
                    index++;
                  });
                },
                child: const Text(
                  'Weiter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      );
    }
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if (index == 2) {
      return SizedBox(
        height: 280,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Falls dein Problem besondere Arbeit benötigt, teile uns deine Mail mit.',
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Color(0xFF2A2A2A),
                fontWeight: FontWeight.bold,
              ),
            ),
            Space(
              height: 15,
            ),
            Center(
              child: SizedBox(
                width: 250,
                child: TextField(
                  onChanged: (s) {
                    setState(() {});
                  },
                  maxLength: 30,
                  maxLines: 1,
                  minLines: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: textEditingController,
                  textAlignVertical: const TextAlignVertical(y: -0.65),
                  style:
                      const TextStyle(color: Color(0xFF414141), fontSize: 16),
                  textAlign: TextAlign.start,
                  cursorColor: const Color(0xFF414141),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF414141), width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF7F7CD2), width: 2),
                    ),
                    hoverColor: Color(0xFF414141),
                    labelText: ' E-Mail',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                      backgroundColor: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
            Space(
              height: 10,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  shadowColor: MaterialStatePropertyAll(Colors.black),
                  elevation: MaterialStatePropertyAll(0.0001),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                onPressed: () async {
                  mail = textEditingController!.text;
                  textEditingController = TextEditingController();
                  setState(() {
                    index++;
                  });
                },
                child: const Text(
                  'Weiter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      );
    }
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if (index == 3) {
      return SizedBox(
        height: 560,
        width: 400,
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            Space(
              height: 15,
            ),
            const Center(
              child: Text(
                'Erzähle uns mehr.',
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Space(
              height: 15,
            ),
            Center(
              child: SizedBox(
                width: 250,
                child: TextField(
                  onChanged: (s) {
                    setState(() {});
                  },
                  maxLength: 400,
                  maxLines: 30,
                  minLines: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: textEditingController,
                  textAlignVertical: const TextAlignVertical(y: -0.65),
                  style:
                      const TextStyle(color: Color(0xFF414141), fontSize: 16),
                  textAlign: TextAlign.start,
                  cursorColor: const Color(0xFF414141),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF414141), width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF7F7CD2), width: 2),
                    ),
                    hoverColor: Color(0xFF414141),
                    labelText: ' Dein Problem',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                      backgroundColor: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
            Space(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    shadowColor: MaterialStatePropertyAll(Colors.black),
                    elevation: MaterialStatePropertyAll(0.0001),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      if (textEditingController!.text.length > 29) {
                        Navigator.pop(context);
                        const uuid = Uuid();
                        final generatedUuid = uuid.v4();
                        final now = DateTime.now();
                        final dateFormatter = DateFormat('yyyy-MM-dd');
                        final timeFormatter = DateFormat('HH:mm:ss');
                        final currentDate = dateFormatter.format(now);
                        final currentTime = timeFormatter.format(now);
                        ShutterDialog.show(context,
                            'Danke fürs Absenden. Sobald die Anfrage beantwortet wurde, wird dir die Antwort beim start der App/ per Mail angezeigt.');
                        await Database.support().quest(
                            generatedUuid,
                            'Super request, $currentDate at $currentTime. Reason $reason, App-area: $piece, Mail: $mail. Message: ${textEditingController!.text}',
                            Data.user!.name);
                      } else {
                        ShutterDialog.show(
                            context, 'Gebe mindestens 30 Zeichen an.');
                      }
                    } catch (e) {
                      ShutterDialog.show(
                          context, 'Fehler, öffne die Seite neu.');
                    }
                  },
                  child: const Text(
                    'Absenden',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            Space(
              height: 10,
            ),
            Center(
              child: const Text(
                'Mit dem Absenden erklärst ',
                textScaleFactor: 0.8,
              ),
            ),
            Center(
              child: GestureDetector(
                child: const Text('du dich mit der DSGVO',
                    textScaleFactor: 0.8,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    )),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PrivacyPolicy().build(context);
                  }));
                },
              ),
            ),
            Center(
              child: const Text(
                ' einverstanden.   ',
                textScaleFactor: 0.8,
              ),
            ),
          ],
        ),
      );
    }
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------
    return const SizedBox(
      width: 400,
      height: 300,
      child: Center(
        child: Text(
          'Error 404:\nCouldnt find for what you asking for.',
          textAlign: TextAlign.center,
          textScaleFactor: 1.3,
          style: TextStyle(
            color: Color(0xFF2F2F2F),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
