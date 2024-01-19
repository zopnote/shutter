import 'package:flutter/cupertino.dart';
import 'package:shutter/core/data/container/data.dart';

class InfoText extends StatelessWidget {
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
              text: 'Shutter ist in der mächtigen ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'Dart programming language ',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'mit dem ebenso starken  ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'Flutter framework ',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  'geschrieben. Beides sind Open-Source Projekte von Google. Für diese stehen eine breite Flut an Packages zur Verfügung. Genutz habe ich ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'mysql1',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'shared_preferences',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'google_nav_bar',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'audioplayers',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'flutter_native_splash',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'vibration',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'lottie',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'url_launcher',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'tab_indicator_styler',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'flutter_custom_tab_bar',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'flutter_inappwebview',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'page_transition',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'flutter_tabler_icons',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'ionicons',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ', ',
              style: TextStyle(color: Data.colorText),
            ),
            TextSpan(
              text: 'cupertino_icons',
              style: TextStyle(
                color: Data.colorText,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  ' um nur die wichtigsten zu nennen.  \nAlso, Dankeschön an all die fähigen Entwickler und die, die ich aus Platzgründen nicht nennen konnte. Mit besonderem Augenmerk auf die kostenlosen und Copyrightfreien Lotte-Animationen. Danke!',
              style: TextStyle(color: Data.colorText),
            ),
          ],
        ),
      ),
    );
  }
}
