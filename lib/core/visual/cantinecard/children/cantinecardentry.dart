import 'package:shutter/core/visual/cantinecard/children/weekday.dart';

class CantineCardEntry {
  Weekday weekday;
  String regularDinnerTitle;
  String regularDinnerDescription;
  String vegetarianDinnerTitle;
  String vegetarianDinnerDescription;

  CantineCardEntry(
    this.weekday, {
    required this.regularDinnerTitle,
    required this.regularDinnerDescription,
    required this.vegetarianDinnerTitle,
    required this.vegetarianDinnerDescription,
  });
}
