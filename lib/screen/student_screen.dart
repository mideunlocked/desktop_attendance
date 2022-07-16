import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({Key? key}) : super(key: key);

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
                  child: Image.network(
                    "https://p.kindpng.com/picc/s/451-4517876_default-profile-hd-png-download.png",
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
              const StudentInfoTile(title: "ID", value: "001"),
              const StudentInfoTile(title: "Student name", value: "John Doe"),
              const StudentInfoTile(title: "Phone", value: "07040225758"),
              const StudentInfoTile(
                  title: "Email address", value: "johndoe@gmail.com"),
              const StudentInfoTile(
                  title: "Term total attendance", value: "30"),
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
              const StudentInfoTile(
                title: "1st Guardian name",
                value: "Mr Doe",
              ),
              const StudentInfoTile(
                title: "1st Guardian number",
                value: "07040225758",
              ),
              const StudentInfoTile(
                title: "1st Guardian email",
                value: "mrdoe@gmail.com",
              ),
              const StudentInfoTile(
                title: "2nd Guardian name",
                value: "Mrs Doe",
              ),
              const StudentInfoTile(
                title: "2nd Guardian number",
                value: "07040225758",
              ),
              const StudentInfoTile(
                title: "2nd Guardian email",
                value: "mrsdoe@gmail.com",
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
