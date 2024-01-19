import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/account.dart';
import 'package:shutter/core/visual/shutterdialog.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController editorOld = TextEditingController();
  late TextEditingController editorNew = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 400,
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Passwort ändern',
            textScaleFactor: 1.6,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF414141),
            ),
          ),
          const SizedBox(
            height: 55,
          ),
          SizedBox(
            width: 250,
            child: Center(
              child: TextField(
                controller: editorOld,
                textAlignVertical: const TextAlignVertical(y: -0.65),
                style: const TextStyle(color: Color(0xFF414141), fontSize: 16),
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
                  labelText: ' Aktuelles Passwort',
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
            height: 40,
          ),
          SizedBox(
            width: 200,
            child: Center(
              child: Align(
                alignment: const Alignment(0, 2),
                child: TextField(
                  cursorColor: const Color(0xFF414141),
                  keyboardType: TextInputType.text,
                  controller: editorNew,
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
                    labelText: ' Neues Passwort',
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
            height: 60,
          ),
          Center(
            child: SizedBox(
              width: 250,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Data.colorSelected),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))))),
                onPressed: () {
                  if (editorNew.text == editorOld.text) {
                    ShutterDialog.show(
                        context, 'Gebe unterschiedliche Passwörter an.');
                    return;
                  }
                  if (editorOld.text != Data.user!.password) {
                    ShutterDialog.show(
                        context, 'Aktuelles Passwort ist falsch.');
                    return;
                  }
                  if (editorNew.text.length < 8) {
                    ShutterDialog.show(context,
                        'Dein neues Passwort muss mindestens 8 Zeichen lang sein.');
                    return;
                  }
                  if (editorNew.text.contains(' ')) {
                    ShutterDialog.show(
                        context, 'Du kannst keine Leerzeichen verwenden.');
                    return;
                  }
                  Account.changePassword(editorNew.text);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  ShutterDialog.show(context, 'Passwort geändert.');
                  return;
                },
                child: const Text(
                  'Setzen',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
