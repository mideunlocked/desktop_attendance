import 'package:flutter/material.dart';
import 'package:windows_demo/helpers/sql_db_helper.dart';
import 'package:windows_demo/models/parent_detail.dart';

import '../models/student.dart';

class StudentsProvider with ChangeNotifier {
  List<Student> _students = [
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

    // SqlDBHelper.insert("student", {
    //   "id": newId,
    //   "name": name,
    //   "number": number,
    //   "email": email,
    //   "totalAttendance": 0,
    //   "imageUrl": "null",
    //   "1st_guardianName": fatherName,
    //   "1st_guardianNumber": fatherNumber,
    //   "1st_guardianEmail": fatherEmail,
    //   "2nd_guardianName": motherName,
    //   "2nd_guardianNumber": motherNumber,
    //   "2nd_guardianEmail": motherEmail,
    // });

    notifyListeners();
  }

  void updateStudent() {
    notifyListeners();
  }

  Future<void> getStudents() async {
    // final studentList = await SqlDBHelper.getData("student");
    // _students = studentList
    //     .map(
    //       (student) => Student(
    //         name: student["name"],
    //         id: student["id"],
    //         emailAddress: student["email"],
    //         number: student["numbeer"],
    //         regularityNumber: student["totalAttendance"],
    //         parentDetails: ParentDetails(
    //           fatherEmail: student["1st_guardianName"],
    //           motherEmail: student["2nd_guardianName"],
    //           motherNumber: student["2nd_guardianNumber"],
    //           fatherName: student['1st_guardianName'],
    //           motherName: student["2nd_guardianName"],
    //           fatherNumber: student["1st_guardianNumber"],
    //         ),
    //       ),
    //     )
    //     .toList();
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
