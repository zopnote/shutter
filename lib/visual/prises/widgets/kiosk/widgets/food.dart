import 'package:flutter/cupertino.dart';

import '../../../../../core/wrapper/general/general.dart';
import '../../../../prises.dart';

class Food extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: General().getScreenWidth() - 290,
          height: 50,
          decoration: const BoxDecoration(
            color: Color(0xFF8B73C5),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Essen',
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
              Prises().createEntry(0.1, 'Kekse'),
              Prises().createEntry(0.2, 'Milchbrötchen'),
              Prises().createEntry(0.2, 'Waffeln'),
              Prises().createEntry(0.4, 'Käsetoast'),
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
