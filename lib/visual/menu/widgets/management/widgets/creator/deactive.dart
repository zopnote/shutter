import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/creator.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/object/user/permissions.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/visual/menu.dart';

class CreatorDeactive extends StatefulWidget {
  @override
  State<CreatorDeactive> createState() => _CreatorDeactiveState();
}

class _CreatorDeactiveState extends State<CreatorDeactive> {
  static TextEditingController textFieldController = TextEditingController();
  static TextEditingController textFieldController2 = TextEditingController();
  bool switchB = true;
  static bool pwVis = true;

  Future<void> continueToCreatorPage() async {
    if (textFieldController.text.length < 3) {
      ShutterDialog.show(
          context, 'Bitte gebe mindestens 3 Zeichen als CreatorID an.');
      return;
    }
    if (textFieldController2.text.length < 8) {
      ShutterDialog.show(
          context, 'Bitte gebe mindestens 8 Zeichen als Passwort an.');
      return;
    }
    if (switchB) {
      //Log-In
      int code = await Creator.logIn(
          textFieldController.text, textFieldController2.text);
      if (code == 404) {
        ShutterDialog.show(context, 'Dieser Creatoraccount existiert nicht.');
        return;
      }
      if (code == 403) {
        ShutterDialog.show(
            context, 'Das angegebende Passwort ist nicht korrekt.');
        return;
      }
    } else {
      //Sign-In
      int code = await Creator.signIn(
          textFieldController.text, textFieldController2.text);
      if (code == 409) {
        ShutterDialog.show(context, 'Der Account existiert bereits.');
        return;
      }
    }
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => Menu(),
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Data.colorBackground,
      home: Scaffold(
        backgroundColor: Data.colorBackground,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Space(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Space(
                          width: 88,
                        ),
                        Container(
                          height: 140,
                          width: 240,
                          foregroundDecoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.asset('assets/branding.jpg')
                                      .image)),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Space(
                      height: 84,
                    ),
                    Row(
                      children: [
                        Space(
                          width: 80,
                        ),
                        LottieBuilder.asset(
                          'assets/animations/fox.json',
                          height: 100,
                          repeat: true,
                          reverse: false,
                        ),
                        const Text(
                          'Creator Programm',
                          textScaleFactor: 1.15,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                  width: 350,
                  child: Text(
                    'Um fortzufahren gebe bitte eine CreatorID an. \nDies kann der Name deiner AG, deines Projektes, deiner Klasse oder ähnliches sein.',
                    textScaleFactor: 1.1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Data.colorText, fontWeight: FontWeight.w400),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 230,
                height: 39,
                decoration: const BoxDecoration(
                  color: Color(0xFFE3E3E3),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: switchB
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 110,
                            height: 39,
                            decoration: BoxDecoration(
                              color: Data.colorSelected,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                            ),
                            child: const Center(
                                child: Text('Anmelden',
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w500))),
                          ),
                          Space(
                            width: 18,
                          ),
                          GestureDetector(
                              child: const Text('Registrieren',
                                  style: TextStyle(
                                      color: Color(0xFF1A1A1A),
                                      fontWeight: FontWeight.w500)),
                              onTap: () {
                                setState(() {
                                  switchB = false;
                                  pwVis = false;
                                });
                              })
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: const Text('Anmelden',
                                style: TextStyle(
                                    color: Color(0xFF1A1A1A),
                                    fontWeight: FontWeight.w500)),
                            onTap: () {
                              setState(() {
                                switchB = true;
                                pwVis = true;
                              });
                            },
                          ),
                          Space(
                            width: 30,
                          ),
                          Container(
                            width: 110,
                            height: 39,
                            decoration: BoxDecoration(
                              color: Data.colorSelected,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                            ),
                            child: const Center(
                                child: Text('Registrieren',
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w500))),
                          ),
                        ],
                      ),
              ),
            ),
            Space(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 260,
                child: Center(
                  child: TextField(
                    onChanged: (s) {
                      setState(() {});
                    },
                    maxLength: 20,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: textFieldController,
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
                      labelText: ' CreatorID',
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
            Center(
              child: switchB
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Space(
                          width: 40,
                        ),
                        SizedBox(
                          width: 260,
                          child: Center(
                            child: TextField(
                              onChanged: (s) {
                                setState(() {});
                              },
                              maxLength: 15,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              controller: textFieldController2,
                              textAlignVertical:
                                  const TextAlignVertical(y: -0.65),
                              style: const TextStyle(
                                  color: Color(0xFF414141), fontSize: 16),
                              textAlign: TextAlign.start,
                              cursorColor: const Color(0xFF414141),
                              obscureText: pwVis,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF414141), width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF7F7CD2), width: 2),
                                ),
                                hoverColor: Color(0xFF414141),
                                labelText: ' Passwort',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF414141),
                                  backgroundColor: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (pwVis) {
                              pwVis = false;
                              setState(() {});
                              return;
                            }
                            pwVis = true;
                            setState(() {});
                            return;
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(pwVis ? Ionicons.eye_off : Ionicons.eye,
                                color: Data.colorSelected, size: 30),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      width: 260,
                      child: Center(
                        child: TextField(
                          onChanged: (s) {
                            setState(() {});
                          },
                          maxLength: 15,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          controller: textFieldController2,
                          textAlignVertical: const TextAlignVertical(y: -0.65),
                          style: const TextStyle(
                              color: Color(0xFF414141), fontSize: 16),
                          textAlign: TextAlign.start,
                          cursorColor: const Color(0xFF414141),
                          obscureText: pwVis,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF414141), width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF7F7CD2), width: 2),
                            ),
                            hoverColor: Color(0xFF414141),
                            labelText: ' Passwort',
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
                        MaterialStatePropertyAll(Data.colorBackground),
                    elevation: const MaterialStatePropertyAll(0),
                    fixedSize: const MaterialStatePropertyAll(Size(175, 60)),
                    maximumSize: const MaterialStatePropertyAll(Size(175, 60)),
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))))),
                onPressed: () {
                  if (textFieldController.text == 'Shutter') {
                    if (Data.user!.permissions == Permissions.Administrator) {
                      continueToCreatorPage();
                      return;
                    }
                    ShutterDialog.show(context,
                        'Dieser Nutzername kann nicht gewählt werden, da du nicht die dazu benötigten Berechtigungen hast.');
                  } else if (textFieldController.text == 'Zopnote') {
                    if (Data.user!.permissions == Permissions.Administrator) {
                      continueToCreatorPage();
                      return;
                    }
                    ShutterDialog.show(context,
                        'Dieser Nutzername kann nicht gewählt werden, da du nicht die dazu benötigten Berechtigungen hast.');
                  } else if (textFieldController.text == 'Colin') {
                    if (Data.user!.permissions == Permissions.Administrator) {
                      continueToCreatorPage();
                      return;
                    }
                    ShutterDialog.show(context,
                        'Dieser Nutzername kann nicht gewählt werden, da du nicht die dazu benötigten Berechtigungen hast.');
                  } else if (textFieldController.text == 'Lenny') {
                    if (Data.user!.permissions == Permissions.Administrator) {
                      continueToCreatorPage();
                      return;
                    }
                    ShutterDialog.show(context,
                        'Dieser Nutzername kann nicht gewählt werden, da du nicht die dazu benötigten Berechtigungen hast.');
                  } else if (textFieldController.text == 'IGS') {
                    if (Data.user!.permissions == Permissions.Administrator) {
                      continueToCreatorPage();
                      return;
                    }
                    ShutterDialog.show(context,
                        'Dieser Nutzername kann nicht gewählt werden, da du nicht die dazu benötigten Berechtigungen hast.');
                  } else if (textFieldController.text == 'igs') {
                    if (Data.user!.permissions == Permissions.Administrator) {
                      continueToCreatorPage();
                      return;
                    }
                    ShutterDialog.show(context,
                        'Dieser Nutzername kann nicht gewählt werden, da du nicht die dazu benötigten Berechtigungen hast.');
                  } else if (textFieldController.text == 'igs Delmenhorst') {
                    if (Data.user!.permissions == Permissions.Administrator) {
                      continueToCreatorPage();
                      return;
                    }
                    ShutterDialog.show(context,
                        'Dieser Nutzername kann nicht gewählt werden, da du nicht die dazu benötigten Berechtigungen hast.');
                  } else if (textFieldController.text == 'IGS Delmenhorst') {
                    if (Data.user!.permissions == Permissions.Administrator) {
                      continueToCreatorPage();
                      return;
                    }
                    ShutterDialog.show(context,
                        'Dieser Nutzername kann nicht gewählt werden, da du nicht die dazu benötigten Berechtigungen hast.');
                  } else if (textFieldController.text == '') {
                    ShutterDialog.show(context,
                        'Bitte vergesse nicht eine CreatorID anzugeben.');
                    return;
                  } else {
                    continueToCreatorPage();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Ionicons.arrow_forward,
                          color: Data.colorSelected, size: 30),
                    ),
                    Text(
                      '  Weiter',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        color: Data.colorSelected,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
