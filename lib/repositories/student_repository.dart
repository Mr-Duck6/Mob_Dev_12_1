import '../models/student.dart';

abstract class StudentRepository {
  Future<Student?> getStudentById(int studentId);

  Future<List<Student>> getAllStudents();

  Future<void> saveStudent(Student student);
}
