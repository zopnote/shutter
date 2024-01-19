import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';

class Deactive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.colorBackground,
      body: Center(
        child: Text(
          'Fehler 403\nKeine Berechtigungen\n\nError in a instance of Management.dart \nand a error in the static data.dart\n\nbecause \nadminMode = false\n creatorMode = false \n\nbut the access was granted',
          textScaleFactor: 2.0,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Data.colorText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
