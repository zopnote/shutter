import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/cantinecard/children/cantinecardentry.dart';
import 'package:shutter/core/visual/shutterdialog.dart';

class CantineCard {
  CantineCardEntry monday;
  CantineCardEntry tuesday;
  CantineCardEntry wednesday;
  CantineCardEntry thursday;
  CantineCardEntry friday;

  String date;

  CantineCard({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.date,
  });

  List<Widget> toList(BuildContext context) {
    List<Widget> entry = [];
    List<CantineCardEntry> cardEntry = [
      monday,
      tuesday,
      wednesday,
      thursday,
      friday
    ];
    for (CantineCardEntry object in cardEntry) {
      Widget widget = _toCard(object, context);
      entry.add(widget);
    }
    return entry;
  }

  static Widget _toCard(CantineCardEntry entry, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 420,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE3E3E3),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Space(
                          width: 30,
                        ),
                        LottieBuilder.asset(
                          'assets/animations/non_veg.json',
                          height: 80,
                          repeat: true,
                          frameRate: FrameRate(26),
                        ),
                        Space(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              entry.regularDinnerTitle,
                              style: const TextStyle(
                                color: Color(0xFF2A2A2A),
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.5,
                            ),
                            const SizedBox(
                              height: 7,
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
                                  ShutterDialog.showObject(
                                    context,
                                    SizedBox(
                                      height: 280,
                                      width: 400,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Stammessen',
                                              style: TextStyle(
                                                color: Color(0xFF2A2A2A),
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textScaleFactor: 1.7,
                                            ),
                                            Space(
                                              height: 10,
                                            ),
                                            Center(
                                              child: SizedBox(
                                                width: 370,
                                                child: Text(
                                                  entry
                                                      .regularDinnerDescription,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Color(0xFF2A2A2A),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textScaleFactor: 1.4,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Mehr zum Gericht',
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 420,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE3E3E3),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Space(
                          width: 30,
                        ),
                        LottieBuilder.asset(
                          'assets/animations/veg.json',
                          height: 80,
                          repeat: true,
                          frameRate: FrameRate(26),
                        ),
                        Space(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              entry.vegetarianDinnerTitle,
                              style: const TextStyle(
                                color: Color(0xFF2A2A2A),
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.5,
                            ),
                            const SizedBox(
                              height: 7,
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
                                  ShutterDialog.showObject(
                                    context,
                                    SizedBox(
                                      height: 280,
                                      width: 400,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Vegetarisch',
                                              style: TextStyle(
                                                color: Color(0xFF2A2A2A),
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textScaleFactor: 1.7,
                                            ),
                                            Space(
                                              height: 10,
                                            ),
                                            Center(
                                              child: SizedBox(
                                                width: 370,
                                                child: Text(
                                                  entry
                                                      .vegetarianDinnerDescription,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Color(0xFF2A2A2A),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textScaleFactor: 1.4,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Mehr zum Gericht',
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
