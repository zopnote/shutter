import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/cantinecard/cantinecard.dart';
import 'package:shutter/core/visual/cantinecard/children/cantinecardentry.dart';
import 'package:shutter/core/visual/cantinecard/children/weekday.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/core/wrapper/network/services/mysql/DataBase.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/cantinecard/cantinecardcontainer.dart';
import 'package:shutter/core/wrapper/network/services/mysql/handler/cantinecard/cantinecardloader.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:vibration/vibration.dart';

class SetCantineCard extends StatefulWidget {
  @override
  State<SetCantineCard> createState() => _SetCantineCardState();
}

class _SetCantineCardState extends State<SetCantineCard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late CantineCard cantineCard = Data.nullCard;
  static bool loaded = false;
  bool _monday = false;
  bool _tuesday = false;
  bool _wednesday = false;
  bool _thursday = false;
  bool _friday = false;
  TextEditingController _controllerA = TextEditingController();

  Future<void> load() async {
    if (!loaded) {
      if (CantineCardContainer.cantineCard == null) {
        await CantineCardLoader.execute();
        loaded = true;
        setState(() {});
      } else {
        loaded = true;
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    load();
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return Column(
        children: [
          Space(
            height: 360,
          ),
          LottieBuilder.asset(
            'assets/animations/loading.json',
            height: 180,
            width: 180,
            repeat: true,
          )
        ],
      );
    }
    //return Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: Data.colorBackground,
    //         foregroundColor: Data.colorText,
    //         elevation: 0,
    //       ),
    //       backgroundColor: Colors.white,
    //       body: Center(
    //         child: LottieBuilder.asset('assets/animations/loading.json'),
    //       ),
    //     );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Data.colorBackground,
        foregroundColor: Data.colorText,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Space(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Mensakarte',
                  textScaleFactor: 2.6,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Data.colorText,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Aktuelle Mensakarte: ${CantineCardContainer.cantineCard!.date}',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Data.colorText,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: TextField(
                controller: _controllerA,
                textAlignVertical: const TextAlignVertical(y: -0.65),
                style: const TextStyle(color: Color(0xFF414141), fontSize: 16),
                textAlign: TextAlign.start,
                maxLength: 30,
                cursorColor: const Color(0xFF414141),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF414141), width: 2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7F7CD2), width: 2),
                  ),
                  hoverColor: Color(0xFF414141),
                  labelText: ' Datum',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF414141),
                    backgroundColor: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TabBar(
                onTap: (value) {
                  if (Data.activeVibration) {
                    Vibration.vibrate(duration: 50);
                  }
                },
                controller: _tabController,
                isScrollable: true,
                physics: const BouncingScrollPhysics(),
                indicator: DotIndicator(
                    color: Data.colorText, distanceFromCenter: 10, radius: 4),
                tabs: [
                  Text(
                    'Montag\n',
                    style: TextStyle(
                      color: Data.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Dienstag\n',
                    style: TextStyle(
                      color: Data.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Mittwoch\n',
                    style: TextStyle(
                      color: Data.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Donerstag\n',
                    style: TextStyle(
                      color: Data.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.2,
                  ),
                  Text(
                    'Freitag\n',
                    style: TextStyle(
                      color: Data.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 500,
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  controller: _tabController,
                  children: [
                    SCCEntry(
                      weekday: Weekday.Monday,
                      instance: this,
                    ),
                    SCCEntry(
                      weekday: Weekday.Tuesday,
                      instance: this,
                    ),
                    SCCEntry(
                      weekday: Weekday.Wednesday,
                      instance: this,
                    ),
                    SCCEntry(
                      weekday: Weekday.Thursday,
                      instance: this,
                    ),
                    SCCEntry(
                      weekday: Weekday.Friday,
                      instance: this,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Data.colorSelected),
                          elevation: const MaterialStatePropertyAll(0),
                          shape: const MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))))),
                      onPressed: () async {
                        if (!_boolAll(this)) {
                          ShutterDialog.show(
                              context, 'Bitte fülle zuerst alle Wochentage.');
                          return;
                        }
                        if (_controllerA.text == '') {
                          ShutterDialog.show(
                              context, 'Vergesse nicht ein Datum anzugeben.');
                          return;
                        }
                        cantineCard.date = _controllerA.text;
                        await Database.cantine().save(cantineCard);
                        Navigator.pop(context);
                        return;
                      },
                      child: const Text(
                        'Hochladen',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1.2,
                      ),
                    ),
                  ),
                  Space(
                    width: 12,
                  ),
                  _all(this),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _boolAll(_SetCantineCardState instance) {
    if (!instance._monday) {
      return false;
    }
    if (!instance._tuesday) {
      return false;
    }
    if (!instance._wednesday) {
      return false;
    }
    if (!instance._thursday) {
      return false;
    }
    if (!instance._friday) {
      return false;
    }
    return true;
  }

  Widget _all(_SetCantineCardState instance) {
    Widget error = Row(
      children: [
        const Text('Unvollständig',
            style: TextStyle(
                color: Color(0xFF252525), fontWeight: FontWeight.w500),
            textScaleFactor: 1.2),
        Space(
          width: 10,
        ),
        const Icon(
          Ionicons.close,
          color: Colors.redAccent,
        ),
      ],
    );
    if (!instance._monday) {
      return error;
    }
    if (!instance._tuesday) {
      return error;
    }
    if (!instance._wednesday) {
      return error;
    }
    if (!instance._thursday) {
      return error;
    }
    if (!instance._friday) {
      return error;
    }
    return Row(
      children: [
        const Text('Bereit',
            style: TextStyle(
                color: Color(0xFF252525), fontWeight: FontWeight.w500),
            textScaleFactor: 1.2),
        Space(
          width: 10,
        ),
        const Icon(
          Ionicons.checkmark,
          color: Colors.green,
        ),
      ],
    );
  }
}

class SCCEntry extends StatefulWidget {
  final _SetCantineCardState instance;
  final Weekday weekday;

  SCCEntry({
    required this.weekday,
    required this.instance,
  });

  @override
  State<SCCEntry> createState() => _SCCEntryState();
}

class _SCCEntryState extends State<SCCEntry> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  TextEditingController _controllerC = TextEditingController();
  TextEditingController _controllerD = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerA,
              textAlignVertical: const TextAlignVertical(y: -0.65),
              style: const TextStyle(color: Color(0xFF414141), fontSize: 16),
              textAlign: TextAlign.start,
              maxLength: 21,
              cursorColor: const Color(0xFF414141),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF414141), width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF7F7CD2), width: 2),
                ),
                hoverColor: Color(0xFF414141),
                labelText: ' Stammessen Titel',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF414141),
                  backgroundColor: Color(0xFFFFFFFF),
                ),
              ),
            ),
            TextField(
              controller: _controllerB,
              textAlignVertical: const TextAlignVertical(y: -0.65),
              style: const TextStyle(color: Color(0xFF414141), fontSize: 16),
              textAlign: TextAlign.start,
              maxLength: 110,
              minLines: 2,
              maxLines: 2,
              cursorColor: const Color(0xFF414141),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF414141), width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF7F7CD2), width: 2),
                ),
                hoverColor: Color(0xFF414141),
                labelText: ' Stammessen Beschreibung',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF414141),
                  backgroundColor: Color(0xFFFFFFFF),
                ),
              ),
            ),
            Space(
              height: 20,
            ),
            TextField(
              controller: _controllerC,
              textAlignVertical: const TextAlignVertical(y: -0.65),
              style: const TextStyle(color: Color(0xFF414141), fontSize: 16),
              textAlign: TextAlign.start,
              maxLength: 21,
              cursorColor: const Color(0xFF414141),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF414141), width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF7F7CD2), width: 2),
                ),
                hoverColor: Color(0xFF414141),
                labelText: ' Vegetarisch Titel',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF414141),
                  backgroundColor: Color(0xFFFFFFFF),
                ),
              ),
            ),
            TextField(
              controller: _controllerD,
              textAlignVertical: const TextAlignVertical(y: -0.65),
              style: const TextStyle(color: Color(0xFF414141), fontSize: 16),
              textAlign: TextAlign.start,
              maxLength: 110,
              minLines: 2,
              maxLines: 2,
              cursorColor: const Color(0xFF414141),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF414141), width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF7F7CD2), width: 2),
                ),
                hoverColor: Color(0xFF414141),
                labelText: ' Vegetarisch Beschreibung',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF414141),
                  backgroundColor: Color(0xFFFFFFFF),
                ),
              ),
            ),
            Space(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Data.colorSelected),
                          elevation: const MaterialStatePropertyAll(0),
                          shape: const MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))))),
                      onPressed: () {
                        CantineCardEntry object = CantineCardEntry(
                          widget.weekday,
                          regularDinnerTitle: _controllerA.text,
                          regularDinnerDescription: _controllerB.text,
                          vegetarianDinnerTitle: _controllerC.text,
                          vegetarianDinnerDescription: _controllerD.text,
                        );
                        if (widget.weekday == Weekday.Monday) {
                          widget.instance.cantineCard.monday = object;
                          widget.instance._monday = true;
                        }
                        if (widget.weekday == Weekday.Tuesday) {
                          widget.instance.cantineCard.tuesday = object;
                          widget.instance._tuesday = true;
                        }
                        if (widget.weekday == Weekday.Wednesday) {
                          widget.instance.cantineCard.wednesday = object;
                          widget.instance._wednesday = true;
                        }
                        if (widget.weekday == Weekday.Thursday) {
                          widget.instance.cantineCard.thursday = object;
                          widget.instance._thursday = true;
                        }
                        if (widget.weekday == Weekday.Friday) {
                          widget.instance.cantineCard.friday = object;
                          widget.instance._friday = true;
                        }
                        widget.instance.refresh();
                        return;
                      },
                      child: const Text(
                        'Speichern',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1.2,
                      ),
                    ),
                  ),
                ),
                Space(
                  width: 10,
                ),
                _icon(widget.weekday, widget.instance),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _icon(Weekday weekday, _SetCantineCardState instance) {
    Widget saved = Row(
      children: [
        const Text('Gespeichert',
            style: TextStyle(
                color: Color(0xFF252525), fontWeight: FontWeight.w500),
            textScaleFactor: 1.2),
        Space(
          width: 10,
        ),
        const Icon(
          Ionicons.checkmark,
          color: Colors.green,
        ),
      ],
    );
    Widget unSaved = Row(
      children: [
        const Text('Nicht Gespeichert',
            style: TextStyle(
                color: Color(0xFF252525), fontWeight: FontWeight.w500),
            textScaleFactor: 1.2),
        Space(
          width: 10,
        ),
        const Icon(
          Ionicons.close,
          color: Colors.redAccent,
        ),
      ],
    );
    if (weekday == Weekday.Monday) {
      if (!instance._monday) {
        return unSaved;
      }
      return saved;
    }
    if (weekday == Weekday.Tuesday) {
      if (!instance._tuesday) {
        return unSaved;
      }
      return saved;
    }
    if (weekday == Weekday.Wednesday) {
      if (!instance._wednesday) {
        return unSaved;
      }
      return saved;
    }
    if (weekday == Weekday.Thursday) {
      if (!instance._thursday) {
        return unSaved;
      }
      return saved;
    }
    if (weekday == Weekday.Friday) {
      if (!instance._friday) {
        return unSaved;
      }
      return saved;
    }
    return Row(
      children: [
        const Text('Fehler',
            style: TextStyle(
                color: Color(0xFF252525), fontWeight: FontWeight.w500),
            textScaleFactor: 1.2),
        Space(
          width: 20,
        ),
        const Icon(
          Ionicons.exit,
          color: Colors.red,
        ),
      ],
    );
  }
}
