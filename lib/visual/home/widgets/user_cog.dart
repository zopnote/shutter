import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/account.dart';
import 'package:shutter/core/data/local/manager/sharedpref.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/main.dart';
import 'package:shutter/shutter.dart';
import 'package:shutter/visual/home/widgets/followed.dart';
import 'package:shutter/visual/home/widgets/start/widgets/children/passwordmanagement.dart';
import 'package:shutter/visual/home/widgets/start/widgets/user_cog/xperience.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/settingscreator.dart';
import 'package:vibration/vibration.dart';

class UserCog extends StatefulWidget {
  @override
  State<UserCog> createState() => _UserCogState();
}

class _UserCogState extends State<UserCog> {
  late bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leadingWidth: 70,
              leading: IconButton(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: 34,
                  color: Data.colorBackground,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const PageLogic(),
                      transitionDuration: const Duration(milliseconds: 30),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                  if (Data.activeVibration) {
                    Vibration.vibrate(duration: 50);
                  }
                },
              ),
              actions: <Widget>[
                IconButton(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    TablerIcons.bookmarks,
                    size: 32,
                    color: Data.colorBackground,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => Followed(),
                        transitionDuration: const Duration(milliseconds: 30),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    );
                    if (Data.activeVibration) {
                      Vibration.vibrate(duration: 50);
                    }
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
              backgroundColor: Data.colorSelected,
              expandedHeight: 150,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Stack(
                  children: [
                    Align(
                      alignment: const Alignment(0, 0.8),
                      child: SizedBox(
                        height: 50,
                        child: Column(
                          children: [
                            Text(
                              Data.user!.name,
                              style: TextStyle(
                                color: Data.colorBackground,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              Data.user!.permissions.name,
                              style: TextStyle(
                                color: Data.colorBackground,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 0.7,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            children: [
              Xperience(),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Account',
                    textScaleFactor: 2.0,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Nutzername',
                    style: TextStyle(
                      color: Color(0xFF414141),
                    ),
                    textScaleFactor: 1.3,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    Data.user!.name,
                    style: const TextStyle(
                      color: Color(0xFF414141),
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.4,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Passwort',
                    style: TextStyle(
                      color: Color(0xFF414141),
                    ),
                    textScaleFactor: 1.3,
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: const Icon(
                      TablerIcons.settings,
                      size: 22,
                      color: Color(0xFF414141),
                    ),
                    onPressed: () {
                      ShutterDialog.showObject(context, PasswortManagement());
                    },
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(
                      visible ? TablerIcons.eye : TablerIcons.eye_off,
                      size: 22,
                      color: const Color(0xFF414141),
                    ),
                    onPressed: () {
                      setState(() {
                        if (visible) {
                          visible = false;
                        } else {
                          visible = true;
                        }
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              (visible
                  ? Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Berechtigungslevel',
                              style: TextStyle(
                                color: Color(0xFF414141),
                              ),
                              textScaleFactor: 1.3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              Data.user!.permissions.name,
                              style: const TextStyle(
                                color: Color(0xFF414141),
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'CreatorID',
                              style: TextStyle(
                                color: Color(0xFF414141),
                              ),
                              textScaleFactor: 1.3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              (Data.creatorID == null)
                                  ? '      -'
                                  : Data.creatorID!,
                              style: const TextStyle(
                                color: Color(0xFF414141),
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  : const SizedBox()),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Daten',
                    textScaleFactor: 2.0,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF414141),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    // TODO: Over prove version when update
                    'Platform:',
                    style: TextStyle(
                      color: Color(0xFF414141),
                    ),
                    textScaleFactor: 1.3,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    getPlatformName(),
                    style: const TextStyle(
                      color: Color(0xFF414141),
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.4,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    // TODO: Over prove version when update
                    'App version:',
                    style: TextStyle(
                      color: Color(0xFF414141),
                    ),
                    textScaleFactor: 1.3,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    Shutter.devMode
                        ? 'Dev ' +
                            TimeOfDay.now().minute.toString() +
                            '.' +
                            TimeOfDay.now().hour.toString()
                        : Shutter.appVersion,
                    style: const TextStyle(
                      color: Color(0xFF414141),
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.4,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 290,
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
                      if (Data.creatorID == null) {
                        ShutterDialog.show(context,
                            'Du bist kein Creator. Bei Interesse stelle eine Supportanfrage.');
                        return;
                      }
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => SettingsCreator(),
                          transitionDuration: const Duration(milliseconds: 30),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    child: const Text(
                      'Einstellungen für Creator öffnen',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: SizedBox(
                  width: 190,
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
                      ShutterDialog.showObject(context, ConfirmDeletion());
                    },
                    child: const Text(
                      'Konto löschen',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: SizedBox(
                  width: 130,
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
                      ShutterDialog.showObject(context, ConfirmLogOut());
                    },
                    child: const Text(
                      'Ausloggen',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.2,
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
      ),
    );
  }

  static String getPlatformName() {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else if (Platform.isMacOS) {
      return 'macOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else {
      return 'Web';
    }
  }
}

class ConfirmDeletion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Bist du dir sicher?',
            style: TextStyle(
                color: Color(0xFF414141), fontWeight: FontWeight.bold),
            textScaleFactor: 1.3,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 220,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Data.colorSelected),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))))),
                onPressed: () async {
                  await SharedPref.resetData();
                  Account.delete();
                },
                child: const Text(
                  'Ja, lösche mein Konto',
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

class ConfirmLogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Bist du dir sicher?',
            style: TextStyle(
                color: Color(0xFF414141), fontWeight: FontWeight.bold),
            textScaleFactor: 1.3,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 220,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Data.colorSelected),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))))),
                onPressed: () async {
                  await SharedPref.resetData();
                  Account.logOut();
                },
                child: const Text(
                  'Ja, logge mich aus.',
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
