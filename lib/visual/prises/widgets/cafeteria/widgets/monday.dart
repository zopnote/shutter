import 'package:flutter/cupertino.dart';
import 'package:shutter/visual/prises.dart';

import '../../../../../core/wrapper/general/general.dart';

class Monday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: General().getScreenWidth() - 290,
          height: 50,
          decoration: const BoxDecoration(
            color: Color(0xFF838AD2),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Montag',
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
                width: 5,
              ),
              Prises().createEntry(2.0, 'Baguette v. Sorten'),
              Prises().createEntry(1.2, 'Wurstbrötchen'),
              Prises().createEntry(1.6, 'Frikadellenbrötchen'),
              Prises().createEntry(1.8, 'Bagel'),
              Prises().createEntry(2.0, 'Dreiecksbrötchen'),
              Prises().createEntry(0.8, 'Laugengebäck'),
              Prises().createEntry(1.8, 'ganze Brötchen'),
              Prises().createEntry(1.1, 'halbe Brötchen'),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
