class Grade_Average {
  double getGradeAverage(List<double> grades) {
    double sum = 0;
    for (double number in grades) {
      sum += number;
    }
    double average = sum / grades.length;
    return average;
  }
}
