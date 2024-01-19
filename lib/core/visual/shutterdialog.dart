import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';

class ShutterDialog {
  static BuildContext showObject(BuildContext context, Widget widget) {
    AlertDialog alertDialog = AlertDialog(
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
      content: widget,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
    return context;
  }

  static BuildContext showConfirmation(
      BuildContext context, Function() func, bool close) {
    AlertDialog alertDialog = AlertDialog(
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
        height: 110,
        width: 230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space(
              height: 15,
            ),
            const Center(
              child: Text(
                'Bist du dir sicher?',
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
                  onPressed: () {
                    if (close) {
                      Navigator.pop(context);
                    }
                    func();
                  },
                  child: const Text(
                    'Ja, Ausführen.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
    return context;
  }

  static void show(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
              top: Radius.circular(50),
            ),
          ),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Data.colorBackground),
          content: SizedBox(
            height: 100,
            width: double.maxFinite,
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                textScaleFactor: 1.2,
                style: TextStyle(color: Data.colorText),
              ),
            ),
          ),
        );
      },
    );
  }
}
