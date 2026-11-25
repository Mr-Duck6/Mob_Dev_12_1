import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:P_12_1/models/student.dart';
import 'package:P_12_1/repositories/student_repository.dart';
import 'package:P_12_1/services/course_manager.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  late MockStudentRepository mockRepository;
  late CourseManager manager;

  setUpAll(() {
    registerFallbackValue(const Student(id: 0, name: '', email: ''));
  });

  setUp(() {
    mockRepository = MockStudentRepository();
    manager = CourseManager(mockRepository);
  });

  group('CourseManager - addGrade', () {
    test('should add grade to student', () async {
      // Arrange
      const student = Student(
        id: 1,
        name: 'Ivan',
        email: 'ivan@gmail.com',
        grades: {'math': 80},
      );

      when(() => mockRepository.getStudentById(1))
          .thenAnswer((_) async => student);

      when(() => mockRepository.saveStudent(any())).thenAnswer((_) async {
        return null;
      });

      await manager.addGrade(1, 'physics', 90);

      final captured = verify(() => mockRepository.saveStudent(captureAny()))
          .captured;

      final updatedStudent = captured.first as Student;

      expect(updatedStudent.grades['math'], 80.0);
      expect(updatedStudent.grades['physics'], 90.0);
      expect(updatedStudent.averageGrade, 85.0);
    });

    test('should throw error if student does not exist', () async {
      when(() => mockRepository.getStudentById(99))
          .thenAnswer((_) async => null);

      expect(() => manager.addGrade(99, 'math', 90), throwsException);
    });

    test('should reject grade greater than 100', () {
      const studentId = 1;
      const courseId = 'math';
      const grade = 120.0;

      expect(
        () => manager.addGrade(studentId, courseId, grade),
        throwsArgumentError,
      );
    });
  });

  group('CourseManager - getStudentReport', () {
    test('should return student report', () async {
      const student = Student(
        id: 1,
        name: 'Ivan',
        email: 'ivan@gmail.com',
        grades: {'math': 90, 'physics': 80},
      );

      when(() => mockRepository.getStudentById(1))
          .thenAnswer((_) async => student);

      final result = await manager.getStudentReport(1);

      expect(result.id, 1);
      expect(result.name, 'Ivan');
      expect(result.averageGrade, 85.0);
    });

    test('should throw error if student does not exist', () {
      when(() => mockRepository.getStudentById(99))
          .thenAnswer((_) async => null);

      expect(() => manager.getStudentReport(99), throwsException);
    });
  });

  group('CourseManager - getTopStudents', () {
    test('should return top students sorted by average grade', () async {
      final students = [
        const Student(
          id: 1,
          name: 'Ivan',
          email: 'ivan@gmail.com',
          grades: {'math': 70},
        ),
        const Student(
          id: 2,
          name: 'Petro',
          email: 'petro@gmail.com',
          grades: {'math': 95},
        ),
        const Student(
          id: 3,
          name: 'Anna',
          email: 'anna@gmail.com',
          grades: {'math': 85},
        ),
      ];

      when(() => mockRepository.getAllStudents())
          .thenAnswer((_) async => students);

      final result = await manager.getTopStudents(2);

      expect(result.length, 2);
      expect(result[0].name, 'Petro');
      expect(result[1].name, 'Anna');
    });

    test('should return empty list when n is zero', () async {

      when(() => mockRepository.getAllStudents()).thenAnswer((_) async => []);

      final result = await manager.getTopStudents(0);

      expect(result, isEmpty);
    });

    test('should throw error when n is negative', () {
      const n = -1;

      expect(() => manager.getTopStudents(n), throwsArgumentError);
    });
  });
}
