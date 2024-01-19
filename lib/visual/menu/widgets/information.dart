import 'package:flutter/material.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/shutter.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/information/contactinfo.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/information/text.dart';
import 'package:shutter/visual/startup/privacypolicy.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.colorBackground,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Space(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    foregroundDecoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                Image.asset('assets/logo_fullsize.jpg').image)),
                  ),
                  Container(
                    height: 130,
                    width: 230,
                    foregroundDecoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset('assets/branding.jpg').image)),
                  ),
                  Text('v${Shutter.appVersion}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      textScaleFactor: 1.8),
                ],
              ),
              const Text(
                'Entwickelt von Zopnote',
                style: TextStyle(fontWeight: FontWeight.w500),
                textScaleFactor: 1.2,
              ),
              const Text(
                '/Lenny Siebert',
                style: TextStyle(fontWeight: FontWeight.w400),
                textScaleFactor: 0.7,
              ),
              Space(
                height: 30,
              ),
              const Text(
                'Frameworks und Packages',
                style: TextStyle(fontWeight: FontWeight.w500),
                textScaleFactor: 1.2,
              ),
              Space(
                height: 10,
              ),
              InfoText(),
              Space(
                height: 40,
              ),
              Text(
                'Wie wir deine Daten nutzen.',
                style: TextStyle(color: Data.colorText),
              ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        shadowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Data.colorSelected),
                        splashFactory: InkRipple.splashFactory,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide.none))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PrivacyPolicy().build(context);
                      }));
                    },
                    child: const Text(
                      'Datenschutzerklärung',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textScaleFactor: 1.1,
                    )),
              ),
              Space(
                height: 30,
              ),
              const Text(
                'Kontakt',
                style: TextStyle(fontWeight: FontWeight.w500),
                textScaleFactor: 1.2,
              ),
              ContactInfoText(),
            ],
          ),
        ],
      ),
    );
  }
}
