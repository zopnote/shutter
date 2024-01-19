import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/account.dart';
import 'package:shutter/core/lace/visual/linkmanager.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/main.dart';
import 'package:shutter/visual/startup/privacypolicy.dart';

class AccountCreation extends StatefulWidget {
  @override
  State<AccountCreation> createState() => _AccountCreationState();
}

class _AccountCreationState extends State<AccountCreation> {
  TextEditingController nameTextFieldController = TextEditingController();
  TextEditingController keyTextFieldController = TextEditingController();
  bool _passwordVisible = true;
  bool switchB = false;
  bool yes = false;

  void _onTextClick() {
    IntentManager().open("github.com/zopnote/repositories");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            Space(
              height: 10,
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
                          'IGS Del. App',
                          textScaleFactor: 1.25,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                width: 300,
                child: const Text(
                  'Erstelle bitte einen Account oder nutze einen bestehenden.',
                  textScaleFactor: 1.25,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Space(
              height: 60,
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
                                  _passwordVisible = true;
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
                                _passwordVisible = false;
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
              height: 35,
            ),
            Center(
              child: SizedBox(
                width: 260,
                child: Center(
                  child: TextField(
                    onChanged: (s) {
                      setState(() {});
                    },
                    maxLength: 45,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: nameTextFieldController,
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
                      labelText: ' Nutzername',
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
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: 260,
                child: Center(
                  child: TextField(
                    onChanged: (s) {
                      setState(() {});
                    },
                    maxLength: 45,
                    obscureText: !_passwordVisible,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: keyTextFieldController,
                    textAlignVertical: const TextAlignVertical(y: -0.65),
                    style:
                        const TextStyle(color: Color(0xFF414141), fontSize: 16),
                    textAlign: TextAlign.start,
                    cursorColor: const Color(0xFF414141),
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF414141), width: 2),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Data.colorText,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF7F7CD2), width: 2),
                      ),
                      hoverColor: const Color(0xFF414141),
                      labelText: ' Passwort',
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF414141),
                        backgroundColor: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Space(
              height: 40,
            ),
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
                  child: const Text('DSGVO',
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                      )),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PrivacyPolicy().build(context);
                    }));
                  },
                ),
                const Text(' einverstanden.   '),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Data.colorSelected),
                    elevation: const MaterialStatePropertyAll(0),
                    fixedSize: const MaterialStatePropertyAll(Size(235, 60)),
                    maximumSize: const MaterialStatePropertyAll(Size(235, 40)),
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))))),
                onPressed: () async {
                  if (!yes) {
                    ShutterDialog.show(context,
                        'Bitte akzeptiere zu allererst die Datenschutzerklärung.');
                    return;
                  }
                  if (nameTextFieldController.text.length > 2) {
                    if (keyTextFieldController.text.length > 7) {
                      if (nameTextFieldController.text.contains(' ')) {
                        ShutterDialog.show(
                            context, 'Du kannst keine Leerzeichen verwenden.');
                        return;
                      }
                      if (keyTextFieldController.text.contains(' ')) {
                        ShutterDialog.show(
                            context, 'Du kannst keine Leerzeichen verwenden.');
                        return;
                      }
                      if (Data.user == null) {
                        if (switchB) {
                          int i = await Account.logIn(
                              nameTextFieldController.text,
                              keyTextFieldController.text);
                          if (i != 0) {
                            if (i == 403) {
                              ShutterDialog.show(context,
                                  'Das angegebende Passwort ist nicht korrekt.');
                              return;
                            }
                            if (i == 404) {
                              ShutterDialog.show(context,
                                  'Der Nutzer wurde nicht gefunden, überprüfe deine Angaben oder registriere dich.');
                              return;
                            }
                          }
                        } else {
                          if (!(await Account.signIn(
                              nameTextFieldController.text,
                              keyTextFieldController.text))) {
                            ShutterDialog.show(context,
                                'Ein Nutzer hat bereits deinen Namen.');
                            return;
                          }
                        }
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PageLogic(),
                        ),
                      );
                    } else {
                      ShutterDialog.show(context,
                          'Dein Passwort muss mindestens 8 Zeichen lang sein.');
                    }
                  } else {
                    if (keyTextFieldController.text.length < 8) {
                      ShutterDialog.show(context,
                          'Dein Passwort muss mindestens 8 Zeichen lang sein.');
                    }
                    ShutterDialog.show(context,
                        'Dein Name muss mindestens 3 Zeichen lang sein.');
                  }
                },
                child: Text(
                  'Klicke zum fortfahren',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Data.colorBackground,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
