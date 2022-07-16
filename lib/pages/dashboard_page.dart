import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DashBoardPage extends StatefulWidget {
  final bool size;
  const DashBoardPage({Key? key, required this.size}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var hexColor = HexColor("0F1339");
    var copyWithStyle = theme.textTheme.headlineMedium
        ?.copyWith(fontSize: widget.size == false ? 15 : null, color: hexColor);
    var height = MediaQuery.of(context).size.height;

    var edgeInsets = EdgeInsets.symmetric(
      horizontal: widget.size == false
          ? height == height
              ? 30
              : 20
          : 80,
      vertical: 20,
    );
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard",
                style: theme.textTheme.headlineLarge
                    ?.copyWith(fontSize: widget.size == false ? 20 : null),
              ),
              Text(
                "De-charis field tutorial college",
                style: theme.textTheme.headlineMedium
                    ?.copyWith(fontSize: widget.size == false ? 15 : null),
              ),
            ],
          ),
          Padding(
            padding: edgeInsets,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: HexColor("BFC8F8"),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "FIRST STUDENT IN",
                          style: copyWithStyle,
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              hexColor,
                            ),
                          ),
                          child: const Text(
                            "Full list",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: const NetworkImage(
                            "https://www.clipartmax.com/png/middle/427-4272664_intermediate-student-profile-logo.png",
                          ),
                          radius: widget.size == false ? 30 : 50,
                        ),
                        SizedBox(
                          width: widget.size == false ? 50 : 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "John Doe",
                              style: copyWithStyle,
                            ),
                            Text(
                              "Student id: 001",
                              style: copyWithStyle,
                            ),
                            Text(
                              "07: 30",
                              style: copyWithStyle?.copyWith(
                                  fontWeight: FontWeight.w200, fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              hexColor,
                            ),
                          ),
                          child: const Text(
                            "Student info",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: edgeInsets,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TwoFieldCard(
                  title: "Students in",
                  value: "101",
                  style: copyWithStyle!,
                ),
                SizedBox(width: widget.size == true ? 100 : 50),
                TwoFieldCard(
                  title: "Time remaining for validation",
                  value: "01:45:12",
                  style: copyWithStyle,
                ),
              ],
            ),
          ),
          const AttenderPickerButton()
        ],
      ),
    );
  }
}

class AttenderPickerButton extends StatefulWidget {
  const AttenderPickerButton({
    Key? key,
  }) : super(key: key);

  @override
  State<AttenderPickerButton> createState() => _AttenderPickerButtonState();
}

class _AttenderPickerButtonState extends State<AttenderPickerButton> {
  bool isStarted = false;

  void toggleStarted() {
    setState(() {
      isStarted = !isStarted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              isStarted == true ? Colors.red : Colors.green,
            ),
          ),
          onPressed: toggleStarted,
          child: Text(isStarted == true
              ? "Stop Attender Picking"
              : "Start Attender Picking"),
        ),
      ),
    );
  }
}

class TwoFieldCard extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle style;

  const TwoFieldCard({
    Key? key,
    required this.title,
    required this.value,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: HexColor("BFC8F8"),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(
                title,
                style: style,
              ),
              Text(
                value,
                style: style.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
