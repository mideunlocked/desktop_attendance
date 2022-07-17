import 'student.dart';

class StudentGuardian {
  final String name;
  final String emailAddress;
  final String imageUrl;
  final String number;
  final List<Student> students;

  StudentGuardian({
    this.imageUrl = "null",
    required this.name,
    required this.emailAddress,
    required this.number,
    required this.students,
  });
}
