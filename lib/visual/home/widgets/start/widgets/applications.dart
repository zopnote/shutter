import 'package:flutter/material.dart';
import 'package:shutter/core/lace/visual/linkmanager.dart';
import 'package:shutter/core/lace/visual/space.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120,
        width: 360,
        decoration: const BoxDecoration(
          color: Color(0xFFE3E3E3),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 110,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color(0xFF8D80C7),
                    ),
                    child: Center(
                      child: Container(
                        height: 70,
                        width: 70,
                        foregroundDecoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  Image.asset('assets/brand_iserv.png').image),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Space(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'IServ ist die \nSchulplattform der IGS. \nDu bleibst angemeldet.',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Color(0xFF252525),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shadowColor: const MaterialStatePropertyAll(Colors.black),
                      elevation: MaterialStatePropertyAll(0.0001),
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return IServ(
                                url: 'https://igs-del.de', fullscreen: true);
                          },
                          fullscreenDialog: true));
                    },
                    child: const Text(
                      'Öffnen in der App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
