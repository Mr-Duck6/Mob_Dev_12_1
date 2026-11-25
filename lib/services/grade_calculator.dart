class GradeCalculator {
  // Перевірка правильності оцінок
  void _validateGrades(List<double> grades) {
    for (final grade in grades) {
      if (grade < 0 || grade > 100 || !grade.isFinite) {
        throw ArgumentError('Grade must be between 0 and 100');
      }
    }
  }

  // Середня оцінка
  double calculateAverage(List<double> grades) {
    _validateGrades(grades);

    if (grades.isEmpty) return 0.0;

    final total = grades.reduce((a, b) => a + b);
    return total / grades.length;
  }

  // Переведення відсотків у GPA
  double _gradeToGPA(double grade) {
    if (grade >= 90) return 4.0;
    if (grade >= 75) return 3.0;
    if (grade >= 60) return 2.0;
    if (grade >= 50) return 1.0;
    return 0.0;
  }

  // Середній GPA
  double calculateGPA(List<double> grades) {
    _validateGrades(grades);

    if (grades.isEmpty) return 0.0;

    final gpaValues = grades.map(_gradeToGPA).toList();

    return gpaValues.reduce((a, b) => a + b) / gpaValues.length;
  }

  // Отримання буквеної оцінки
  String getLetterGrade(double score) {
    _validateGrades([score]);

    if (score >= 90) return 'A';
    if (score >= 75) return 'B';
    if (score >= 60) return 'C';
    if (score >= 50) return 'D';
    return 'F';
  }

  // Перевірка прохідної оцінки
  bool isPassingGrade(double score) {
    _validateGrades([score]);

    return score >= 60;
  }
}
