import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class General {
  static int pCounter = 0;
  static bool pBool = false;

  double getScreenWidth() {
    final screenWidth = WidgetsBinding.instance.window.physicalSize.width;
    final devicePixelRatio = WidgetsBinding.instance.window.devicePixelRatio;
    return screenWidth / devicePixelRatio;
  }

  double getScreenHeight() {
    final screenHeight = WidgetsBinding.instance.window.physicalSize.height;
    final devicePixelRatio = WidgetsBinding.instance.window.devicePixelRatio;
    return screenHeight / devicePixelRatio;
  }
}

class D {
  static bool p() {
    if (kDebugMode) {
      General.pCounter++;
      print('${General.pCounter} ${StackTrace.current.toString()}');
      return true;
    }
    return false;
  }

  static void s() {
    if (kDebugMode) {
      General.pCounter = 0;
      General.pBool = true;
    }
  }

  static void e() {
    if (kDebugMode) {
      General.pCounter = 0;
      General.pBool = false;
    }
  }
}

bool p(String message) {
  if (kDebugMode) {
    print(message);
    return true;
  }
  return false;
}
