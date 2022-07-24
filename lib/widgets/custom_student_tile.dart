import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../models/parent_detail.dart';
import '../screen/student_screen.dart';

class CustomStudentTile extends StatelessWidget {
  final String name;
  final String number;
  final String id;
  final String imageUrl;
  final String emailAddress;
  final String totalAttendanceNumber;
  final ParentDetails parentDetails;

  const CustomStudentTile({
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return StudentScreen(
            name: name,
            number: number,
            id: id,
            imageUrl: imageUrl,
            emailAddress: emailAddress,
            parentDetails: parentDetails,
            totalAttendanceNumber: totalAttendanceNumber,
          );
        }));
      },
      child: Container(
        height: 500,
        width: 300,
        decoration: BoxDecoration(
          color: HexColor("02004D"),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: imageUrl == "null"
                    ? Image.asset(
                        "assets\\deafult_profile.png",
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      )
                    : Image.network(
                        imageUrl,
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
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Text(
              "ID: $id",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
