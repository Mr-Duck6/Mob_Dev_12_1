import 'package:flutter_test/flutter_test.dart';
import 'package:P_12_1/models/student.dart';

void main() {
  group('Student Model Tests', () {
    test('fromJson should create Student correctly', () {
      final json = {
        'id': 1,
        'name': 'Ivan',
        'email': 'ivan@gmail.com',
        'grades': {'math': 90.0, 'physics': 80.0},
      };

      // Act
      final student = Student.fromJson(json);

      expect(student.id, 1);
      expect(student.name, 'Ivan');
      expect(student.email, 'ivan@gmail.com');
      expect(student.grades['math'], 90.0);
    });

    test('toJson should convert Student correctly', () {
      const student = Student(
        id: 1,
        name: 'Ivan',
        email: 'ivan@gmail.com',
        grades: {'math': 90.0},
      );

      final json = student.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Ivan');
      expect(json['email'], 'ivan@gmail.com');
      expect(json['grades'], {'math': 90.0});
    });

    test('copyWith should update student name', () {
      const student = Student(id: 1, name: 'Ivan', email: 'ivan@gmail.com');

      final updated = student.copyWith(name: 'Petro');

      expect(updated.name, 'Petro');
      expect(updated.id, 1);
      expect(updated.email, 'ivan@gmail.com');
    });

    test('averageGrade should calculate average correctly', () {
      const student = Student(
        id: 1,
        name: 'Ivan',
        email: 'ivan@gmail.com',
        grades: {'math': 90, 'physics': 80, 'chemistry': 70},
      );

      final result = student.averageGrade;

      expect(result, 80.0);
    });

    test('averageGrade should return zero for empty grades', () {
      const student = Student(id: 1, name: 'Ivan', email: 'ivan@gmail.com');

      final result = student.averageGrade;

      expect(result, 0.0);
    });
  });
}
