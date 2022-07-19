import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../models/parent_detail.dart';
import '../models/student.dart';
import '../widgets/student_info_tile.dart';

class StudentScreen extends StatefulWidget {
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
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  void initState() {
    super.initState();
  }

  final nameTextController = TextEditingController();
  final emailAddressTextController = TextEditingController();
  final numberTextController = TextEditingController();
  final fatherNameTextController = TextEditingController();
  final motherNameTextController = TextEditingController();
  final fatherNumberTextController = TextEditingController();
  final motherNumberTextController = TextEditingController();
  final fatherEmailTextController = TextEditingController();
  final motherEmailTextController = TextEditingController();

  final emailNode = FocusNode();
  final numberNode = FocusNode();
  final fatherNameNode = FocusNode();
  final motherNameNode = FocusNode();
  final fatherNumberNode = FocusNode();
  final motherNumberNode = FocusNode();
  final fatherEmailNode = FocusNode();
  final motherEmailNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameTextController.dispose();
    emailAddressTextController.dispose();
    numberTextController.dispose();
    fatherEmailTextController.dispose();
    motherEmailTextController.dispose();
    fatherNumberTextController.dispose();
    motherNumberTextController.dispose();
    fatherNameTextController.dispose();
    motherNameTextController.dispose();

    emailNode.dispose();
    numberNode.dispose();
    fatherEmailNode.dispose();
    motherEmailNode.dispose();
    fatherNumberNode.dispose();
    motherNumberNode.dispose();
    fatherNameNode.dispose();
    motherNameNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size2 = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student profile"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    HexColor("C5C3FF"),
                  ),
                ),
                onPressed: showEditStudentInfo,
                child: const Text(
                  "Update info",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
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
                  child: widget.imageUrl == "null"
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
                          File(widget.imageUrl),
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
              StudentInfoTile(title: "ID", value: widget.id),
              StudentInfoTile(title: "Student name", value: widget.name),
              StudentInfoTile(title: "Phone", value: widget.number),
              StudentInfoTile(
                  title: "Email address", value: widget.emailAddress),
              StudentInfoTile(
                  title: "Term total attendance",
                  value: widget.totalAttendanceNumber),
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
                value: widget.parentDetails.fatherEmail,
              ),
              StudentInfoTile(
                title: "1st Guardian number",
                value: widget.parentDetails.fatherNumber,
              ),
              StudentInfoTile(
                title: "1st Guardian email",
                value: widget.parentDetails.fatherEmail,
              ),
              StudentInfoTile(
                title: "2nd Guardian name",
                value: widget.parentDetails.motherName,
              ),
              StudentInfoTile(
                title: "2nd Guardian number",
                value: widget.parentDetails.motherNumber,
              ),
              StudentInfoTile(
                title: "2nd Guardian email",
                value: widget.parentDetails.motherEmail,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showEditStudentInfo() {
    RegExp reg = RegExp('[0-9.,]+');
    bool addExtraGuardian = false;

    showDialog(
      context: context,
      builder: ((context) {
        var size = MediaQuery.of(context).size;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height / 6, horizontal: size.width / 5),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        "Edit Student Info",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: nameTextController,
                                    autocorrect: false,
                                    autofocus: true,
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                      label: Text("Student name"),
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                    validator: ((value) {
                                      if (value?.isEmpty == true) {
                                        return "Student name is required";
                                      }
                                      return null;
                                    }),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(emailNode);
                                    },
                                  ),
                                  TextFormField(
                                    controller: emailAddressTextController,
                                    focusNode: emailNode,
                                    autocorrect: false,
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                      label: Text("Student email"),
                                      hintText: "name@gmail.com",
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                    validator: ((value) {
                                      if (value?.isEmpty == true) {
                                        return "Student email is required";
                                      } else if (value?.contains(".com") ==
                                          false) {
                                        return "Enter a valid email";
                                      } else if (value?.contains("@") ==
                                          false) {
                                        return "Enter a valid email";
                                      }
                                      return null;
                                    }),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(numberNode);
                                    },
                                  ),
                                  TextFormField(
                                    controller: numberTextController,
                                    focusNode: numberNode,
                                    autocorrect: false,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      label: Text("Student number"),
                                    ),
                                    mouseCursor: MouseCursor.uncontrolled,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9.,]+')),
                                    ],
                                    validator: ((value) {
                                      if (value?.isEmpty == true) {
                                        return "Student number is required";
                                      }
                                      return null;
                                    }),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(fatherNameNode);
                                    },
                                  ),
                                  TextFormField(
                                    controller: fatherNameTextController,
                                    focusNode: fatherNameNode,
                                    autocorrect: false,
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                      label: Text("1st Guardian name"),
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                    validator: ((value) {
                                      if (value?.isEmpty == true) {
                                        return "Parameter is required";
                                      }
                                      return null;
                                    }),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(fatherNumberNode);
                                    },
                                  ),
                                  TextFormField(
                                    controller: fatherNumberTextController,
                                    focusNode: fatherNumberNode,
                                    autocorrect: false,
                                    keyboardType: TextInputType.name,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9.,]+')),
                                    ],
                                    decoration: const InputDecoration(
                                      label: Text("1st Guardian number"),
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                    validator: ((value) {
                                      if (value?.isEmpty == true) {
                                        return "Parameter is required";
                                      }
                                      return null;
                                    }),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(fatherEmailNode);
                                    },
                                  ),
                                  TextFormField(
                                    controller: fatherEmailTextController,
                                    focusNode: fatherEmailNode,
                                    autocorrect: false,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      label: Text("1st Guardian email"),
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                    validator: ((value) {
                                      if (value?.isEmpty == true) {
                                        return "Parameter is required";
                                      } else if (value?.contains(".com") ==
                                          false) {
                                        return "Enter a valid email";
                                      } else if (value?.contains("@") ==
                                          false) {
                                        return "Enter a valid email";
                                      }
                                      return null;
                                    }),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(motherNameNode);
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        addExtraGuardian = !addExtraGuardian;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            addExtraGuardian == false
                                                ? Icons
                                                    .add_circle_outline_rounded
                                                : Icons
                                                    .remove_circle_outline_outlined,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            addExtraGuardian == false
                                                ? "Add extra guardian"
                                                : "Remove extra guardian",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  addExtraGuardian == false
                                      ? const Text("")
                                      : Column(
                                          children: [
                                            TextFormField(
                                              controller:
                                                  motherNameTextController,
                                              focusNode: motherNameNode,
                                              autocorrect: false,
                                              keyboardType: TextInputType.name,
                                              decoration: const InputDecoration(
                                                label:
                                                    Text("2nd Guardian name"),
                                              ),
                                              mouseCursor: MouseCursor.defer,
                                              validator:
                                                  addExtraGuardian == false
                                                      ? ((value) {
                                                          return null;
                                                        })
                                                      : ((value) {
                                                          if (value?.isEmpty ==
                                                              true) {
                                                            return "Parameter is required";
                                                          }
                                                          return null;
                                                        }),
                                              textInputAction:
                                                  TextInputAction.next,
                                              onFieldSubmitted:
                                                  addExtraGuardian == false
                                                      ? (_) {}
                                                      : (_) {
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  motherNumberNode);
                                                        },
                                            ),
                                            TextFormField(
                                              controller:
                                                  motherNumberTextController,
                                              focusNode: motherNumberNode,
                                              autocorrect: false,
                                              keyboardType: TextInputType.name,
                                              decoration: const InputDecoration(
                                                label:
                                                    Text("2nd Guardian number"),
                                              ),
                                              mouseCursor: MouseCursor.defer,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp('[0-9.,]+')),
                                              ],
                                              validator:
                                                  addExtraGuardian == false
                                                      ? ((value) {
                                                          return null;
                                                        })
                                                      : ((value) {
                                                          if (value?.isEmpty ==
                                                              true) {
                                                            return "Parameter is required";
                                                          }
                                                          return null;
                                                        }),
                                              textInputAction:
                                                  TextInputAction.next,
                                              onFieldSubmitted:
                                                  addExtraGuardian == false
                                                      ? (_) {}
                                                      : (_) {
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  motherEmailNode);
                                                        },
                                            ),
                                            TextFormField(
                                              controller:
                                                  motherEmailTextController,
                                              focusNode: motherEmailNode,
                                              autocorrect: false,
                                              keyboardType: TextInputType.name,
                                              decoration: const InputDecoration(
                                                label:
                                                    Text("2nd Guardian email"),
                                              ),
                                              mouseCursor: MouseCursor.defer,
                                              validator: addExtraGuardian ==
                                                      false
                                                  ? ((value) {
                                                      return null;
                                                    })
                                                  : ((value) {
                                                      if (value?.isEmpty ==
                                                          true) {
                                                        return "Parameter is required";
                                                      } else if (value
                                                              ?.contains(
                                                                  ".com") ==
                                                          false) {
                                                        return "Enter a valid email";
                                                      } else if (value
                                                              ?.contains("@") ==
                                                          false) {
                                                        return "Enter a valid email";
                                                      }
                                                      return null;
                                                    }),
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Save"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        );
      }),
    );
  }
}
