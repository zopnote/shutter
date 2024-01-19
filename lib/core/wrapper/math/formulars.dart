import 'dart:math';

class Formulars {
  double getBetween(double start, double end) {
    Random random = Random();
    double randomDouble = start + random.nextDouble() * (end - start);
    return randomDouble;
  }
}
