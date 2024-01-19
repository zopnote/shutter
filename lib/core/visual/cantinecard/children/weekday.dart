enum Weekday { Monday, Tuesday, Wednesday, Thursday, Friday }

class Weekdays {
  static Weekday parse(String value) {
    return Weekday.values.firstWhere(
      (permission) => permission.toString() == 'Weekday.$value',
      orElse: () => Weekday.Monday,
    );
  }
}
