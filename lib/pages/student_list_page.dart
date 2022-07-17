import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:windows_demo/models/parent_detail.dart';
import 'package:windows_demo/providers/student_provider.dart';
import 'package:windows_demo/screen/student_screen.dart';

class StudentListPage extends StatefulWidget {
  final bool screenSize;

  const StudentListPage({Key? key, required this.screenSize}) : super(key: key);

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  @override
  Widget build(BuildContext context) {
    var size2 = MediaQuery.of(context).size;
    return Consumer<StudentsProvider>(
      builder: ((context, snapshot, child) => Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: widget.screenSize == false
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: customStudentListAppBar(size2),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: customStudentListAppBar(size2),
                          ),
                  ),
                ),
                Flexible(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 6 / 7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: snapshot.students.length,
                    itemBuilder: ((context, index) {
                      var value = snapshot.students[index];
                      return CustomStudentTile(
                        name: value.name,
                        number: value.number,
                        id: value.id,
                        imageUrl: value.imageUrl,
                        emailAddress: value.emailAddress,
                        totalAttendanceNumber:
                            value.regularityNumber.toString(),
                        parentDetails: value.parentDetails,
                      );
                    }),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  List<Widget> customStudentListAppBar(Size size2) {
    return [
      Container(
        width: size2.width / 1.5,
        decoration: BoxDecoration(
          color: HexColor('BFC8F8'),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                  )),
              hintText: "Search students by id or name",
              hintStyle: const TextStyle(color: Colors.white60, fontSize: 15),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Add Student"),
      ),
    ];
  }
}

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
