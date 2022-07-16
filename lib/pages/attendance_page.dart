import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:windows_demo/pages/dashboard_page.dart';

class AttendancePage extends StatefulWidget {
  final bool size;

  const AttendancePage({Key? key, required this.size}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var sizedBox = SizedBox(height: widget.size == true ? 70 : 30);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Take Attendance",
                style: theme.textTheme.headlineLarge
                    ?.copyWith(fontSize: widget.size == false ? 20 : null),
              ),
              const Spacer(),
              const Expanded(child: AttenderPickerButton()),
            ],
          ),
          sizedBox,
          Container(
            decoration: BoxDecoration(
              color: HexColor('BFC8F8'),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_rounded,
                        color: Colors.grey[300],
                      )),
                  hintText: "Search students by id or name",
                  hintStyle:
                      const TextStyle(color: Colors.white60, fontSize: 15),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          sizedBox,
          Flexible(
            child: SingleChildScrollView(
              child: Table(
                border: TableBorder.all(color: HexColor("0F1339")),
                children: const [
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "Number",
                      ),
                      CustomTableCell(
                        value: "Name",
                      ),
                      CustomTableCell(
                        value: "Student id",
                      ),
                      CustomTableCell(
                        value: "Time in",
                      ),
                      CustomTableCell(
                        value: "Time out",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomTableCell(
                        value: "1",
                      ),
                      CustomTableCell(
                        value: "John Doe",
                      ),
                      CustomTableCell(
                        value: "001",
                      ),
                      CustomTableCell(
                        value: "07:30",
                      ),
                      CustomTableCell(
                        value: "----",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTableCell extends StatelessWidget {
  final String value;

  const CustomTableCell({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(value),
      ),
    );
  }
}
