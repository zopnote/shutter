import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/shutter.dart';
import 'package:shutter/visual/home/widgets/start.dart';
import 'package:shutter/visual/menu.dart';
import 'package:shutter/visual/music.dart';
import 'package:shutter/visual/startup/accountcreation.dart';
import 'package:vibration/vibration.dart';
import 'package:workmanager/workmanager.dart';

import 'visual/overview.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    // Your background task logic goes here
    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    await Shutter.debug();
  }
  await Shutter.onRun();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  if (isFirstLaunch) {
    await Shutter.onFirstLaunch();
    await prefs.setBool('isFirstLaunch', false);
  } else {
    await Shutter.onLaunch();
  }
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Shutter.onBuild(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageLogic(),
    );
  }
}

class PageLogic extends StatefulWidget {
  const PageLogic({Key? key}) : super(key: key);

  @override
  State<PageLogic> createState() => ExtendedPageLogic();
}

class ExtendedPageLogic extends State<PageLogic> {
  int _selectedIndex = 1;
  final List<Widget> _pages = <Widget>[
    Overview(),
    Start(),
    const Music(),
    Menu(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Data.user != null) {
      return Scaffold(
        backgroundColor: Data.colorBackground,
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.2, vertical: 17),
          child: Container(
            color: Color(0xFFFFFFFF),
            height: 65,
            child: GNav(
                backgroundColor: Data.colorBackground,
                tabActiveBorder:
                    Border.all(color: Data.colorSelected, width: 3),
                gap: 10,
                color: Data.colorUnselected,
                activeColor: Data.colorSelected,
                haptic: true,
                padding: EdgeInsets.all(12),
                selectedIndex: 1,
                onTabChange: (value) {
                  _onItemTapped(value);
                  if (Data.activeVibration) {
                    Vibration.vibrate(duration: 40);
                  }
                },
                tabs: [
                  GButton(
                    style: GnavStyle.google,
                    icon: Icons.window_rounded,
                    text: 'Übersicht',
                  ),
                  GButton(
                    icon: Icons.home_work_rounded,
                    text: 'Hauptseite',
                  ),
                  GButton(
                    icon: Icons.music_note_rounded,
                    text: 'Disco',
                  ),
                  GButton(
                    icon: Ionicons.menu,
                    text: 'Menü',
                  ),
                ]),
          ),
        ),
      );
    }
    return AccountCreation();
  }
}
