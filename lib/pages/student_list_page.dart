import 'package:flutter/material.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Student list page"),
    );
  }
}
