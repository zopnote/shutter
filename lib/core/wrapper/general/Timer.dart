import 'package:shared_preferences/shared_preferences.dart';

class ShutterTimer {
  static Future<void> reset() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('timerStartTime');
  }

  static Future<bool> use() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('timerStartTime')) {
      final int savedTime = prefs.getInt('timerStartTime') ?? 0;
      final int currentTime = DateTime.now().millisecondsSinceEpoch;

      final int elapsedTime = currentTime - savedTime;

      if (elapsedTime < 5 * 24 * 60 * 60 * 1000) {
        final int remainingTime = 5 * 24 * 60 * 60 * 1000 - elapsedTime;
        print('Verbleibende Zeit in Millisekunden: $remainingTime');
        return false;
      } else {
        _start();
        return true;
      }
    } else {
      _start();
      return true;
    }
  }

  static Future<int> get() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final int savedTime = prefs.getInt('timerStartTime') ?? 0;
    if (savedTime == 0) {
      return 0;
    }
    final int currentTime = DateTime.now().millisecondsSinceEpoch;

    final int elapsedTime = currentTime - savedTime;

    final int remainingTime = 5 * 24 * 60 * 60 * 1000 - elapsedTime;
    return remainingTime;
  }

  static Future<void> _start() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int startTime = DateTime.now().millisecondsSinceEpoch;
    prefs.setInt('timerStartTime', startTime);
    print('Timer gestartet.');
  }
}
