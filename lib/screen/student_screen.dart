import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../models/parent_detail.dart';

class StudentScreen extends StatelessWidget {
  final String name;
  final String number;
  final String id;
  final String imageUrl;
  final String emailAddress;
  final String totalAttendanceNumber;
  final ParentDetails parentDetails;

  const StudentScreen({
    Key? key,
    required this.name,
    required this.number,
    required this.id,
    required this.imageUrl,
    required this.emailAddress,
    required this.parentDetails,
    required this.totalAttendanceNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size2 = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student profile"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: imageUrl == "null"
                      ? Image.asset(
                          "assets\\deafult_profile.png",
                          fit: BoxFit.cover,
                          height: 180,
                          width: double.infinity,
                          errorBuilder: ((context, error, stackTrace) {
                            return SizedBox(
                              height: 180,
                              width: double.infinity,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: HexColor("C5C3FF"),
                                ),
                              ),
                            );
                          }),
                        )
                      : Image.file(
                          File(imageUrl),
                          fit: BoxFit.cover,
                          height: 180,
                          width: double.infinity,
                          errorBuilder: ((context, error, stackTrace) {
                            return SizedBox(
                              height: 180,
                              width: double.infinity,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: HexColor("C5C3FF"),
                                ),
                              ),
                            );
                          }),
                        ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              StudentInfoTile(title: "ID", value: id),
              StudentInfoTile(title: "Student name", value: name),
              StudentInfoTile(title: "Phone", value: number),
              StudentInfoTile(title: "Email address", value: emailAddress),
              StudentInfoTile(
                  title: "Term total attendance", value: totalAttendanceNumber),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Guardian Details",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 15,
              ),
              StudentInfoTile(
                title: "1st Guardian name",
                value: parentDetails.fatherEmail,
              ),
              StudentInfoTile(
                title: "1st Guardian number",
                value: parentDetails.fatherNumber,
              ),
              StudentInfoTile(
                title: "1st Guardian email",
                value: parentDetails.fatherEmail,
              ),
              StudentInfoTile(
                title: "2nd Guardian name",
                value: parentDetails.motherName,
              ),
              StudentInfoTile(
                title: "2nd Guardian number",
                value: parentDetails.motherNumber,
              ),
              StudentInfoTile(
                title: "2nd Guardian email",
                value: parentDetails.motherEmail,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentInfoTile extends StatelessWidget {
  final String title;
  final String value;

  const StudentInfoTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title: ",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
