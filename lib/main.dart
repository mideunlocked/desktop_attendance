import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:windows_demo/providers/student_provider.dart';

import 'pages/home_page.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => StudentsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: HexColor("0F1339"),
          appBarTheme: AppBarTheme(backgroundColor: HexColor("0F1339")),
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: HexColor("0F1339")),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
            headlineMedium: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: HexColor('0F1339'),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
