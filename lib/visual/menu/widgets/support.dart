import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/support/bug.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/support/default.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/support/idea.dart';

class Support extends StatefulWidget {
  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.colorBackground,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Space(
            height: 40,
          ),
          Stack(
            children: [
              Column(
                children: [
                  Space(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Space(
                        width: 88,
                      ),
                      Container(
                        height: 140,
                        width: 240,
                        foregroundDecoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    Image.asset('assets/branding.jpg').image)),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Space(
                    height: 84,
                  ),
                  Row(
                    children: [
                      Space(
                        width: 80,
                      ),
                      LottieBuilder.asset(
                        'assets/animations/fox.json',
                        height: 100,
                        repeat: true,
                        reverse: false,
                      ),
                      const Text(
                        'Supportbereich',
                        textScaleFactor: 1.25,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Space(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFE3E3E3),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  height: 170,
                  width: 170,
                  child: Center(
                    child: Column(
                      children: [
                        Space(
                          height: 15,
                        ),
                        LottieBuilder.asset(
                          'assets/animations/shutter_start.json',
                          height: 85,
                          repeat: false,
                        ),
                        Space(
                          height: 5,
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.black),
                              elevation: MaterialStatePropertyAll(0.0001),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                              ),
                            ),
                            onPressed: () {
                              ShutterDialog.showObject(context, Idea());
                            },
                            child: const Text(
                              'Idee äußern',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFE3E3E3),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  height: 170,
                  width: 170,
                  child: Center(
                    child: Column(
                      children: [
                        Space(
                          height: 20,
                        ),
                        LottieBuilder.asset(
                          'assets/animations/bugs.json',
                          height: 80,
                          repeat: true,
                        ),
                        Space(
                          height: 5,
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.black),
                              elevation: MaterialStatePropertyAll(0.0001),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                              ),
                            ),
                            onPressed: () {
                              ShutterDialog.showObject(context, Bug());
                            },
                            child: const Text(
                              'Fehler melden',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFE3E3E3),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                height: 80,
                width: 360,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LottieBuilder.asset(
                        'assets/animations/anonymus.json',
                        height: 100,
                        reverse: true,
                        repeat: true,
                      ),
                      Space(
                        width: 0,
                      ),
                      const SizedBox(
                        width: 260,
                        height: 60,
                        child: Center(
                          child: Text(
                            'Supportanfragen sind End zu End verschlüsselt.',
                            textScaleFactor: 1.25,
                            style: TextStyle(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFE3E3E3),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                height: 80,
                width: 360,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Space(
                        width: 15,
                      ),
                      LottieBuilder.asset(
                        'assets/animations/cat.json',
                        height: 60,
                        reverse: true,
                        repeat: true,
                      ),
                      Space(
                        width: 0,
                      ),
                      SizedBox(
                        width: 260,
                        height: 60,
                        child: Center(
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black),
                                shadowColor:
                                    MaterialStatePropertyAll(Colors.black),
                                elevation: MaterialStatePropertyAll(0.0001),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                ShutterDialog.showObject(context, DefaultMsg());
                              },
                              child: const Text(
                                'Andere Anfrage stellen',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
