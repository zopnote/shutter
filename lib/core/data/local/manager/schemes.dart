import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shutter/core/wrapper/math/formulars.dart';

import '../../container/data.dart';

@deprecated
enum Scheme {
  darkPurple,
  lightPurple,
  darkBlue,
  lightBlue,
  darkYellow,
  lightYellow,
  darkRed,
  lightRed,
  darkGreen,
  lightGreen,
  darkWine,
  shutter
}

@deprecated
class Schemes {
  static const Color darkPurple = Color(0xFF644D9D);
  static const Color lightPurple = Color(0xFF896CD5);
  static const Color darkBlue = Color(0xFF536DBB);
  static const Color lightBlue = Color(0xFF5E79CC);
  static const Color darkYellow = Color(0xFFBE963B);
  static const Color lightYellow = Color(0xFFE79400);
  static const Color darkRed = Color(0xFFAB3535);
  static const Color lightRed = Color(0xFFDC5656);
  static const Color darkWine = Color(0xFF810D0D);
  static const Color darkGreen = Color(0xFF52A84C);
  static const Color lightGreen = Color(0xFF5FA43D);

  static const Color darkEnvironmentUnselected = Color(0xFF414141);
  static const Color darkEnvironmentText = Color(0xFFD3D3D3);
  static const Color darkEnvironmentBackground = Color(0xFF181818);

  static const Color lightEnvironmentUnselected = Color(0xFF949494);
  static const Color lightEnvironmentText = Color(0xFF252525);
  static const Color lightEnvironmentBackground = Color(0xFFFFFFFF);

  static const Color shutterA = Color(0xFF7F7CD2);
  static const Color shutterB = Color(0xFF2A8EEE);

  static const Gradient shutterGradient = LinearGradient(
      colors: [Color(0xFF2A8EEE), Color(0xFF833ABD)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  Color defaultColor(bool getOnlyShutterB) {
    if (getOnlyShutterB) {
      if (Data.colorSelected == shutterA) {
        return shutterB;
      } else {
        return Data.colorSelected;
      }
    } else {
      if (Data.colorSelected == shutterA) {
        double a = Formulars().getBetween(1, 3);
        if (a < 2) {
          return shutterA;
        } else if (a > 2) {
          return shutterB;
        } else {
          return shutterA;
        }
      } else {
        return Data.colorSelected;
      }
    }
  }

  static GradientBoxBorder _shutterBorder(double width) {
    List<Alignment> alignmentsA = [
      Alignment.topCenter,
      Alignment.bottomCenter,
      Alignment.topRight,
      Alignment.bottomLeft,
      Alignment.topLeft,
      Alignment.bottomRight,
      Alignment.bottomCenter,
      Alignment.topCenter,
      Alignment.bottomLeft,
      Alignment.topRight,
      Alignment.bottomRight,
      Alignment.topLeft,
    ];
    List<Alignment> alignmentsB = [
      Alignment.bottomCenter,
      Alignment.topCenter,
      Alignment.bottomLeft,
      Alignment.topRight,
      Alignment.bottomRight,
      Alignment.topLeft,
      Alignment.topCenter,
      Alignment.bottomCenter,
      Alignment.topRight,
      Alignment.bottomLeft,
      Alignment.topLeft,
      Alignment.bottomRight,
    ];
    Random random = Random();
    int randomIndex = random.nextInt(alignmentsA.length);
    Alignment alignmentA = alignmentsA.elementAt(randomIndex);
    Alignment alignmentB = alignmentsB.elementAt(randomIndex);
    return GradientBoxBorder(
        gradient: LinearGradient(
            colors: const [Color(0xFF2A8EEE), Color(0xFF833ABD)],
            begin: alignmentA,
            end: alignmentB),
        width: width);
  }

  static Border _normalBorder(double width) {
    return Border.all(
      width: width,
      color: Data.colorSelected,
    );
  }

  static dynamic defaultBorder(double width) {
    if (Data.colorSelected == shutterA) {
      return _shutterBorder(width);
    } else {
      return _normalBorder(width);
    }
  }

  static BoxDecoration _shutterBoxDecoration() {
    List<Alignment> alignmentsA = [
      Alignment.topCenter,
      Alignment.bottomCenter,
      Alignment.topRight,
      Alignment.bottomLeft,
      Alignment.topLeft,
      Alignment.bottomRight,
    ];
    List<Alignment> alignmentsB = [
      Alignment.bottomCenter,
      Alignment.topCenter,
      Alignment.bottomLeft,
      Alignment.topRight,
      Alignment.bottomRight,
      Alignment.topLeft,
    ];
    Random random = Random();
    int randomIndex = random.nextInt(alignmentsA.length);
    Alignment alignmentA = alignmentsA.elementAt(randomIndex);
    Alignment alignmentB = alignmentsB.elementAt(randomIndex);
    return BoxDecoration(
        border: GradientBoxBorder(
            gradient: LinearGradient(
                colors: const [Color(0xFF2A8EEE), Color(0xFF833ABD)],
                begin: alignmentA,
                end: alignmentB),
            width: 7),
        borderRadius: BorderRadius.circular(40));
  }

  static BoxDecoration _normalBoxDecoration() {
    return BoxDecoration(
        border: Border.all(
          width: 7,
          color: Data.colorSelected,
        ),
        borderRadius: BorderRadius.circular(40));
  }

  static BoxDecoration defaultBoxDecoration() {
    if (Data.colorSelected == shutterA) {
      return _shutterBoxDecoration();
    } else {
      return _normalBoxDecoration();
    }
  }

  static Gradient defaultGradient() {
    if (Data.colorSelected == shutterA) {
      return shutterGradient;
    } else {
      return LinearGradient(colors: [Data.colorSelected, Data.colorSelected]);
    }
  }
}
