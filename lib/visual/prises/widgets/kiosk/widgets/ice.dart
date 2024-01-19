import 'package:flutter/cupertino.dart';

import '../../../../../core/wrapper/general/general.dart';
import '../../../../prises.dart';

class Ice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: General().getScreenWidth() - 320,
          height: 50,
          decoration: const BoxDecoration(
            color: Color(0xFFA799E7),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Eis',
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
              Prises().createEntry(0.5, 'kl. Eis'),
              Prises().createEntry(0.8, 'gr. Eis'),
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
