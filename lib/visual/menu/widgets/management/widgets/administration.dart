import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/visual/shutterdialog.dart';
import 'package:shutter/core/wrapper/network/services/mysql/DataBase.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/administration/widgets/seesupport.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/administration/widgets/setcantinecard.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/administration/widgets/status.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/administration/widgets/users.dart';

class AdminPanel extends StatefulWidget {
  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.colorBackground,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(15),
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LottieBuilder.asset(
                'assets/animations/folder_write.json',
                width: 180,
                height: 180,
                repeat: false,
              ),
              Container(
                height: 90,
                width: 180,
                foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/administration.png').image)),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Icon(Ionicons.arrow_down, size: 50),
          ),
          const SizedBox(
            height: 20,
          ),
          EntryARF(
            title: 'Status',
            reversed: true,
            iconSize: 140,
            icon: TablerIcons.home_stats,
            function: () {
              ShutterDialog.showObject(context, Status());
            },
          ),
          EntryARF(
            title: 'Mensakarte',
            reversed: false,
            iconSize: 140,
            icon: TablerIcons.coffee,
            function: () async {
              try {
                await Database.cantine().get();
              } catch (e) {
                ShutterDialog.show(
                    context, 'Keine Verbindung zum Server möglich.');
                return;
              }
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => SetCantineCard(),
                  transitionDuration: const Duration(milliseconds: 200),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
          ),
          EntryARF(
            title: 'Support',
            reversed: true,
            iconSize: 140,
            icon: TablerIcons.help,
            function: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const AdminSupport(),
                  transitionDuration: const Duration(milliseconds: 200),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
          ),
          EntryARF(
            title: 'Artikel',
            reversed: false,
            iconSize: 140,
            icon: TablerIcons.news,
            function: () {
              ShutterDialog.showObject(
                  context,
                  SizedBox(
                    width: 390,
                    height: 390,
                    child: Center(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          const SizedBox(height: 10),
                          LottieBuilder.asset(
                            'assets/animations/in_development.json',
                          ),
                          Text(
                            'Dieses Feature ist noch in Entwicklung...',
                            style: TextStyle(
                                color: Data.colorText,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
          EntryARF(
            title: 'MySQL',
            reversed: true,
            iconSize: 140,
            icon: TablerIcons.database,
            function: () {
              ShutterDialog.showObject(
                  context,
                  SizedBox(
                    width: 390,
                    height: 390,
                    child: Center(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          const SizedBox(height: 10),
                          LottieBuilder.asset(
                            'assets/animations/in_development.json',
                          ),
                          Text(
                            'Dieses Feature ist noch in Entwicklung...',
                            style: TextStyle(
                                color: Data.colorText,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
          EntryARF(
            title: 'Nutzer',
            reversed: false,
            iconSize: 140,
            icon: TablerIcons.users,
            function: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => UserAdmin(),
                  transitionDuration: const Duration(milliseconds: 200),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
            },
          ),
          EntryARF(
            title: 'Statistik',
            reversed: true,
            iconSize: 140,
            icon: TablerIcons.graph,
            function: () {
              ShutterDialog.showObject(
                  context,
                  SizedBox(
                    width: 390,
                    height: 390,
                    child: Center(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          const SizedBox(height: 10),
                          LottieBuilder.asset(
                            'assets/animations/in_development.json',
                          ),
                          Text(
                            'Dieses Feature ist noch in Entwicklung...',
                            style: TextStyle(
                                color: Data.colorText,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}

class EntryARF extends StatelessWidget {
  final Function()? function;
  final bool reversed;
  final String title;
  final double iconSize;
  final IconData icon;

  EntryARF({
    required this.icon,
    required this.iconSize,
    required this.title,
    required this.reversed,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    if (!reversed) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Icon(
                icon,
                size: iconSize,
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                Text(title,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shadowColor: MaterialStatePropertyAll(Colors.black),
                      elevation: MaterialStatePropertyAll(0.0001),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                    onPressed: function,
                    child: const Text(
                      'Klicke zum öffnen',
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
      );
    }
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    shadowColor: MaterialStatePropertyAll(Colors.black),
                    elevation: MaterialStatePropertyAll(0.0001),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                  onPressed: function,
                  child: const Text(
                    'Klicke zum öffnen',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Icon(
              icon,
              size: iconSize,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
