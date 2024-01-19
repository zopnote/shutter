import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/visual/music/widgets/infodialog.dart';

class InformationButtons extends StatelessWidget {
  const InformationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 55,
            width: 130,
            child: ElevatedButton(
              style: ButtonStyle(
                  shadowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Data.colorSelected),
                  splashFactory: InkRipple.splashFactory,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide.none))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InfoPageDisco()),
                );
              },
              child: const Text('Infos zur Disco',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Color(0xFFFFFFFF))),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 220,
            height: 55,
            child: ElevatedButton(
              style: ButtonStyle(
                  shadowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Data.colorSelected),
                  splashFactory: InkRipple.splashFactory,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide.none))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InfoPageRules()),
                );
              },
              child: const Text('Regeln für das Einreichen',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Color(0xFFFFFFFF))),
            ),
          ),
        ],
      ),
    );
  }
}
