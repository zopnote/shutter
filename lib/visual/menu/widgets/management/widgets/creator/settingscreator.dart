import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/creator.dart';
import 'package:shutter/core/lace/visual/space.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/core/wrapper/network/services/mysql/database.dart';
import 'package:shutter/visual/menu.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator/settings/connecteduser.dart';
import 'package:uuid/uuid.dart';
import 'package:vibration/vibration.dart';

class SettingsCreator extends StatefulWidget {
  @override
  State<SettingsCreator> createState() => _SettingsCreatorState();
}

class _SettingsCreatorState extends State<SettingsCreator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.colorBackground,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [_buildAppBar()];
        },
        body: CreatorSetObj(),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      leadingWidth: 170,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          if (Data.activeVibration) {
            Vibration.vibrate(duration: 50);
          }
        },
        child: Column(
          children: [
            Space(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Space(
                  width: 14,
                ),
                Icon(
                  TablerIcons.arrow_back,
                  size: 34,
                  color: Data.colorBackground,
                ),
                Space(
                  width: 15,
                ),
                Text(
                  'Zurück',
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Data.colorBackground,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Data.colorSelected,
      expandedHeight: 85,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(23),
        ),
      ),
    );
  }
}

class CreatorSetObj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Space(
          height: 50,
        ),
        const Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Text(
              'Account',
              textScaleFactor: 2.0,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF414141),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          width: 330,
          decoration: const BoxDecoration(
            color: Color(0xFFE3E3E3),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Data.colorSelected,
                child: const Align(
                  alignment: Alignment(0, -0.1),
                  child: Icon(
                    TablerIcons.user,
                    size: 30,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 194,
                child: Text(
                  Data.creatorID!,
                  textScaleFactor: 1.45,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF414141),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ShutterDialog.showObject(
                      context,
                      SizedBox(
                        height: 120,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Bist du dir sicher?',
                              style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1.3,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: SizedBox(
                                width: 220,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Data.colorSelected),
                                      elevation:
                                          const MaterialStatePropertyAll(0),
                                      shape: const MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25))))),
                                  onPressed: () async {
                                    await Creator.logOut();
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) => Menu(),
                                        transitionDuration:
                                            const Duration(seconds: 1),
                                        transitionsBuilder: (_, a, __, c) =>
                                            FadeTransition(
                                                opacity: a, child: c),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Ja, logge mich aus.',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
                child: Container(
                  width: 63,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Data.colorSelected,
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const Icon(
                    Icons.logout_rounded,
                    size: 27,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        ),
        Space(
          height: 50,
        ),
        EntryCA(
            title: 'Mit dieser CreatorID verbundende Nutzer',
            child: ConnectedUser()),
        Space(
          height: 30,
        ),
        Center(
          child: SizedBox(
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Data.colorSelected),
                  elevation: const MaterialStatePropertyAll(0),
                  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))))),
              onPressed: () {
                ShutterDialog.showConfirmation(context, () async {
                  final uuid = const Uuid();
                  final generatedUuid = uuid.v4();
                  final now = DateTime.now();
                  final dateFormatter = DateFormat('yyyy-MM-dd');
                  final timeFormatter = DateFormat('HH:mm:ss');
                  final currentDate = dateFormatter.format(now);
                  final currentTime = timeFormatter.format(now);
                  ShutterDialog.show(context,
                      'Danke fürs Absenden. Sobald die Anfrage beantwortet wurde, wird dir die Antwort beim start der App angezeigt.');
                  await Database.support().quest(
                      generatedUuid,
                      'Deletion request, $currentDate at $currentTime. CreatorID is ${Data.creatorID!}. The user ask for a deletion of this account.',
                      Data.user!.name);
                }, true);
              },
              child: const Text(
                'Konto löschung beantragen',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EntryCA extends StatefulWidget {
  final String title;
  final Widget child;

  EntryCA({
    required this.title,
    required this.child,
  });

  @override
  State<EntryCA> createState() => _EntryCAState();
}

class _EntryCAState extends State<EntryCA> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 345,
            decoration: const BoxDecoration(
              color: Color(0xFFE3E3E3),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Data.colorSelected,
                          borderRadius: const BorderRadius.all(Radius.circular(15))),
                      child: Icon(
                        open
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.keyboard_arrow_up_rounded,
                        color: const Color(0xFFE3E3E3),
                        size: 40,
                      )),
                  onTap: () {
                    if (!open) {
                      setState(() {
                        open = true;
                      });
                      return;
                    }
                    setState(() {
                      open = false;
                    });
                    return;
                  },
                ),
                Space(
                  width: 25,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Data.colorText, fontWeight: FontWeight.w500),
                  textScaleFactor: 1.0,
                ),
              ],
            ),
          ),
        ),
        (open ? widget.child : Space()),
      ],
    );
  }
}
