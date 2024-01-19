import 'package:flutter/cupertino.dart';
import 'package:shutter/visual/prises.dart';

import '../../../../../core/wrapper/general/general.dart';

class Drinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: General().getScreenWidth() - 290,
          height: 50,
          decoration: const BoxDecoration(
            color: Color(0xFF7362AB),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Trinken',
              textScaleFactor: 1.5,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
        Container(
          height: 100,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(
                width: 10,
              ),
              Prises().createEntry(0.8, 'Wasser'),
              Prises().createEntry(1.20, 'Apfelschorle'),
              Prises().createEntry(1.80, 'ACE & H²Obst'),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
