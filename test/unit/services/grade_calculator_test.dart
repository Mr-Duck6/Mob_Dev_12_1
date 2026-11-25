import 'package:flutter_test/flutter_test.dart';
import 'package:P_12_1/services/grade_calculator.dart';

void main() {
  late GradeCalculator calculator;

  setUp(() {
    calculator = GradeCalculator();
  });

  group('GradeCalculator - calculateAverage', () {
    test('should calculate average correctly', () {
      final grades = [80.0, 90.0, 70.0];

      final result = calculator.calculateAverage(grades);

      expect(result, 80.0);
    });

    test('should return zero for empty list', () {
      final grades = <double>[];

      final result = calculator.calculateAverage(grades);

      expect(result, 0.0);
    });

    test('should return zero when all grades are zero', () {
      final grades = [0.0, 0.0, 0.0];

      final result = calculator.calculateAverage(grades);

      expect(result, 0.0);
    });

    test('should throw error for grade greater than 100', () {
      final grades = [90.0, 110.0];

      expect(() => calculator.calculateAverage(grades), throwsArgumentError);
    });
  });

  group('GradeCalculator - calculateGPA', () {
    test('90 should return GPA 4.0', () {
      final grades = [90.0];

      final result = calculator.calculateGPA(grades);

      expect(result, 4.0);
    });

    test('75 should return GPA 3.0', () {
      // Arrange
      final grades = [75.0];

      final result = calculator.calculateGPA(grades);

      expect(result, 3.0);
    });

    test('60 should return GPA 2.0', () {
      final grades = [60.0];

      final result = calculator.calculateGPA(grades);

      expect(result, 2.0);
    });

    test('should return zero for empty list', () {
      final grades = <double>[];

      final result = calculator.calculateGPA(grades);

      expect(result, 0.0);
    });

    test('should return zero when all grades are zero', () {
      final grades = [0.0, 0.0];

      final result = calculator.calculateGPA(grades);

      expect(result, 0.0);
    });
  });

  group('GradeCalculator - getLetterGrade', () {
    test('should return A for score 95', () {
      const score = 95.0;

      final result = calculator.getLetterGrade(score);

      expect(result, 'A');
    });

    test('should return B for score 80', () {
      const score = 80.0;

      final result = calculator.getLetterGrade(score);

      expect(result, 'B');
    });

    test('should return F for score 40', () {
      const score = 40.0;

      final result = calculator.getLetterGrade(score);

      expect(result, 'F');
    });
  });

  group('GradeCalculator - isPassingGrade', () {
    test('should return true for score 60', () {
      const score = 60.0;

      final result = calculator.isPassingGrade(score);

      expect(result, true);
    });

    test('should return false for score 59', () {
      const score = 59.0;

      final result = calculator.isPassingGrade(score);

      expect(result, false);
    });

    test('should return false for score zero', () {
      const score = 0.0;

      final result = calculator.isPassingGrade(score);

      expect(result, false);
    });
  });
}
