import 'package:flutter/cupertino.dart';
import 'package:shutter/core/data/container/data.dart';

class ContactInfoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: 'Mail ',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'shutter.sup.dev@gmail.com',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: '\nPost ',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'IGS Delmenhorst -> Pestalozziweg 88',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: '\nTel.: ',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '04221 981060',
              style: TextStyle(color: Data.colorText),
            ),
          ],
        ),
      ),
    );
  }
}
