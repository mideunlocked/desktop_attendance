import 'package:flutter/material.dart';
import 'package:windows_demo/models/parent_detail.dart';

import '../models/student.dart';

class StudentsProvider with ChangeNotifier {
  final List<Student> _students = [
    Student(
      name: "Johnny Dang",
      id: "01",
      regularityNumber: int.parse("1"),
      number: "07040225758",
      emailAddress: "johnnydang@gmail.com",
      parentDetails: ParentDetails(
          motherNumber: "07040225758",
          fatherName: "Mr Dang",
          motherName: "Mrs Dang",
          fatherNumber: "07040225758",
          motherEmail: "mrsdang@gmail.com",
          fatherEmail: "mrdang@gmail.com"),
    ),
  ];

  List<Student> get students {
    return [..._students];
  }

  void createNewStudent(
    String name,
    String email,
    String number,
    String motherName,
    String fatherName,
    String motherNumber,
    String fatherNumber,
    String motherEmail,
    String fatherEmail,
  ) {
    final newId = students.length + 1;

    _students.add(
      Student(
        name: name,
        id: newId.toString(),
        emailAddress: email,
        number: number,
        regularityNumber: 0,
        parentDetails: ParentDetails(
          motherNumber: motherNumber,
          fatherName: fatherName,
          motherName: motherName,
          fatherNumber: fatherNumber,
          fatherEmail: fatherEmail,
          motherEmail: motherEmail,
        ),
      ),
    );
    notifyListeners();
  }

  void updateStudent() {
    notifyListeners();
  }

  void getStudents() {
    notifyListeners();
  }

  void deleteStudent(int id) {
    _students.removeAt(id);
    notifyListeners();
  }

  void getSpecificStudent(String id) {
    _students.firstWhere((element) => element.id == id);
    notifyListeners();
  }
}
