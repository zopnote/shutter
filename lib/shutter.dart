import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/account.dart';
import 'package:shutter/core/data/local/manager/creator.dart';
import 'package:shutter/core/data/local/manager/settings.dart';
import 'package:shutter/core/wrapper/general/Timer.dart';
import 'package:vibration/vibration.dart';

class Shutter {
  static final bool devMode = true;
  static final String appVersion = '1.0';
  static final String dsgvoVersion = '1'; //Only one number
  static bool? connected;

  // Code will run if its the first launch
  static Future<void> onFirstLaunch() async {
    await ShutterTimer.use();
  }

  // Code will run if the app launch and if its not the first launch
  static Future<void> onLaunch() async {}

  // Code will run directly after the widgets are initialized
  static Future<void> onRun() async {
    await _network();
    await _local();
    if (Data.activeSound) {
      AudioPlayer().play(AssetSource('sounds/startup.mp3'));
    }
    if (Data.activeVibration) {
      Vibration.vibrate(duration: 100);
    }
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // Code will running if kDebug (and before onRun())
  static Future<void> debug() async {}

  // Code will run when the first build method is called
  static Future<void> onBuild(BuildContext context) async {
    FlutterNativeSplash.remove();
  }

  static Future<void> _local() async {
    await Creator.load();
    await Account.load();
    await Settings.load();
  }

  static Future<void> _network() async {}
}
