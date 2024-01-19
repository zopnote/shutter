import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/visual/home/widgets/start/widgets/children/children/changepassword.dart';

class PasswortManagement extends StatelessWidget {
  const PasswortManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 300,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Passwort-Verwaltung',
            textScaleFactor: 1.6,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF414141),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Center(
            child: Text(
              'Passwortlänge',
              style: TextStyle(
                color: Color(0xFF414141),
              ),
              textScaleFactor: 1.1,
            ),
          ),
          Center(
            child: Text(
              Data.user!.password.length.toString() + " Zeichen",
              style: const TextStyle(
                color: Color(0xFF414141),
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1.2,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Center(
            child: Text(
              'Passwort ändern...',
              style: TextStyle(
                color: Color(0xFF414141),
              ),
              textScaleFactor: 1.1,
            ),
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
                  ShutterDialog.showObject(context, ChangePassword());
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
