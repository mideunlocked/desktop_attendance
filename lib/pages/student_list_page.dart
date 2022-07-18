import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:windows_demo/providers/student_provider.dart';

import '../widgets/custom_student_tile.dart';

class StudentListPage extends StatefulWidget {
  final bool screenSize;

  const StudentListPage({Key? key, required this.screenSize}) : super(key: key);

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
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

  List<int> selectedIndex = [];
  bool selectActive = false;

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.screenSize == false
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: customStudentListAppBar(size2),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: customStudentListAppBar(size2),
                              ),
                        selectActive == true
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      selectedIndex.isEmpty == true
                                          ? Colors.grey
                                          : Colors.red,
                                    ),
                                  ),
                                  onPressed: () {
                                    var index = 0;

                                    for (index in selectedIndex) {
                                      snapshot.deleteStudent(index);
                                    }
                                  },
                                  child: Text(
                                    "Delete ${selectedIndex.length} students",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            : const Text(""),
                      ],
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
                      bool isSelected = false;
                      bool isChanged = false;

                      void toggle() {
                        setState(() {
                          isChanged = !isChanged;
                          isSelected = isChanged;
                        });
                      }

                      return InkWell(
                        onLongPress: () {
                          setState(() {
                            selectActive = !selectActive;
                          });
                        },
                        child: Stack(
                          children: [
                            CustomStudentTile(
                              name: value.name,
                              number: value.number,
                              id: value.id,
                              imageUrl: value.imageUrl,
                              emailAddress: value.emailAddress,
                              totalAttendanceNumber:
                                  value.regularityNumber.toString(),
                              parentDetails: value.parentDetails,
                            ),
                            selectActive == true
                                ? IconButton(
                                    onPressed: () {
                                      toggle();

                                      if (selectedIndex.contains(index) ==
                                          true) {
                                        selectedIndex.removeWhere(
                                            (element) => element == index);
                                      } else {
                                        selectedIndex.add(index);
                                      }
                                    },
                                    icon: isSelected == false
                                        ? const Icon(
                                            Icons
                                                .check_box_outline_blank_rounded,
                                            color: Colors.grey,
                                          )
                                        : const Icon(Icons.check_box_rounded,
                                            color: Colors.grey),
                                  )
                                : const Text(""),
                          ],
                        ),
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
        onPressed: showCreateStudentDialogue,
        label: const Text("Add Student"),
      ),
    ];
  }

  void showCreateStudentDialogue() {
    RegExp reg = RegExp('[0-9.,]+');
    bool addExtraGuardian = false;

    var index = 0;
    for (index in selectedIndex) {
      print(index);
    }

    setState(() {
      selectActive = false;
      selectedIndex = [];
    });

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
                        "Create Student",
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
                            onPressed: createStudent,
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

  void createStudent() {
    var isValid = _formKey.currentState?.validate();
    try {
      if (isValid == false) {
        return;
      } else {
        print('started');
        _formKey.currentState?.save();
        Provider.of<StudentsProvider>(
          context,
          listen: false,
        ).createNewStudent(
          nameTextController.text.trim(),
          emailAddressTextController.text.trim(),
          numberTextController.text.trim(),
          motherNameTextController.text.trim(),
          fatherNameTextController.text.trim(),
          motherNumberTextController.text.trim(),
          fatherNumberTextController.text.trim(),
          motherEmailTextController.text.trim(),
          fatherEmailTextController.text.trim(),
        );
      }
      print("done");
      Navigator.pop(context);
    } catch (err) {
      print(err.toString());
    }
  }
}
