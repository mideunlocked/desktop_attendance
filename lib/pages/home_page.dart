import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:windows_demo/pages/account_page.dart';
import 'package:windows_demo/pages/attendance_page.dart';
import 'package:windows_demo/pages/dashboard_page.dart';
import 'package:windows_demo/pages/reports_page.dart';
import 'package:windows_demo/pages/settings_page.dart';
import 'package:windows_demo/pages/student_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isScreenSmall = width >= 800 ? true : false;

    return Scaffold(
      body: Row(
        children: <Widget>[
          SizedBox(
            width: isScreenSmall == true ? 200 : 150,
            child: NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              useIndicator: true,
              indicatorColor: HexColor("C5C3FF"),
              backgroundColor: HexColor("0F1339"),
              unselectedLabelTextStyle: TextStyle(
                color: HexColor('FFFFFF'),
              ),
              unselectedIconTheme: IconThemeData(color: HexColor('C5C3FF')),
              selectedLabelTextStyle: TextStyle(
                color: HexColor("C5C3FF"),
              ),
              selectedIconTheme: IconThemeData(color: HexColor('0F1339')),
              labelType: NavigationRailLabelType.all,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard_rounded),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.timeline_rounded),
                  label: Text('Attendance'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.list_alt_rounded),
                  label: Text('Student list'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.report_rounded),
                  label: Text('Reports'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_rounded),
                  label: Text('Settings'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.account_circle_rounded),
                  label: Text('Account'),
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: buildPages(),
          )
        ],
      ),
    );
  }

  Widget buildPages() {
    var width = MediaQuery.of(context).size.width;
    bool isScreenSmall = width >= 800 ? true : false;
    switch (_selectedIndex) {
      case 0:
        return DashBoardPage(
          size: isScreenSmall,
        );
      case 1:
        return AttendancePage(
          size: isScreenSmall,
        );
      case 2:
        return StudentListPage(
          screenSize: isScreenSmall,
        );
      case 3:
        return const ReportsPage();
      case 4:
        return const SettingsPage();
      case 5:
        return const AccountPage();
      default:
        return DashBoardPage(
          size: isScreenSmall,
        );
    }
  }
}
