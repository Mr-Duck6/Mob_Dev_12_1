import '../models/student.dart';
import '../repositories/student_repository.dart';

class CourseManager {
  final StudentRepository repository;

  CourseManager(this.repository);

  // Додавання оцінки студенту
  Future<void> addGrade(int studentId, String courseId, double grade) async {
    if (!grade.isFinite || grade < 0 || grade > 100) {
      throw ArgumentError('Grade must be between 0 and 100');
    }

    final student = await repository.getStudentById(studentId);

    if (student == null) {
      throw Exception('Student not found');
    }

    final updatedGrades = Map<String, double>.from(student.grades);
    updatedGrades[courseId] = grade;

    final updatedStudent = student.copyWith(grades: updatedGrades);

    await repository.saveStudent(updatedStudent);
  }

  // Отримання звіту студента
  Future<Student> getStudentReport(int studentId) async {
    final student = await repository.getStudentById(studentId);

    if (student == null) {
      throw Exception('Student not found');
    }

    return student;
  }

  // Отримання топ-N студентів
  Future<List<Student>> getTopStudents(int n) async {
    if (n < 0) {
      throw ArgumentError('N cannot be negative');
    }

    final students = await repository.getAllStudents();

    final sortedStudents = List<Student>.from(students);

    sortedStudents.sort((a, b) => b.averageGrade.compareTo(a.averageGrade));

    return sortedStudents.take(n).toList();
  }
}
