import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/core/data/local/manager/sharedpref.dart';

class Settings {
  static Future<void> load() async {
    Data.activeSound = await loadSounds();
    Data.activeVibration = await loadVibrations();
    Data.activeAnimations = await loadAnimations();
  }

  static void animations(bool value) {
    Data.activeAnimations = value;
    SharedPref.saveString('settings.animations', value.toString());
  }

  static void vibrations(bool value) {
    Data.activeVibration = value;
    SharedPref.saveString('settings.vibrations', value.toString());
  }

  static void sounds(bool value) {
    Data.activeSound = value;
    SharedPref.saveString('settings.sounds', value.toString());
  }

  static Future<bool> loadSounds() async {
    String? readed = await SharedPref.loadString('settings.sounds');
    if (readed == null) {
      return true;
    }
    if (readed.toLowerCase() == 'true') {
      return true;
    }
    return false;
  }

  static Future<bool> loadVibrations() async {
    String? readed = await SharedPref.loadString('settings.vibrations');
    if (readed == null) {
      return true;
    }
    if (readed.toLowerCase() == 'true') {
      return true;
    }
    return false;
  }

  static Future<bool> loadAnimations() async {
    String? readed = await SharedPref.loadString('settings.animations');
    if (readed == null) {
      return true;
    }
    if (readed.toLowerCase() == 'true') {
      return true;
    }
    return false;
  }
}
