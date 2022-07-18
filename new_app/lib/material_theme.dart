import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:new_app/ChildWelcomePage/childDashboard.dart';
import 'package:new_app/ChildWelcomePage/newwelcomePage.dart';
import 'package:new_app/ChildWelcomePage/selectGender.dart';
import 'package:new_app/ChildWelcomePage/selectageRange.dart';
import 'package:new_app/childrendashboardtargetpages/InsidePages/Bmi/Pages/resultpage.dart';
import 'package:new_app/themes/styles.dart';
import 'package:new_app/themetemple.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'datainputpages/chooseRole.dart';

class MaterialExample extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final VoidCallback onChanged;

  const MaterialExample(
      {Key? key, this.savedThemeMode, required this.onChanged})
      : super(key: key);

  @override
  State<MaterialExample> createState() => _MaterialExampleState();
}

class _MaterialExampleState extends State<MaterialExample> {
  String? name;
  String? gender;
  int? agegroup;

  @override
  void initState() {
    // TODO: implement initState

    getdata();
    super.initState();
  }

  getdata() async {
    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('name');
    final String? gender1 = prefs.getString('gender');
    final int? agegroup1 = prefs.getInt('agerange');
    setState(() {
      name = action;
      gender = gender1;
      agegroup = agegroup1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/result-page': (context) => ResultPage(),
      },
      theme: ThemeData(brightness: Brightness.light, textTheme: TextTheme()),
      darkTheme: ThemeData(brightness: Brightness.dark, textTheme: TextTheme()),
      home: gender == null ? NewWelcomePageForChildren() : ChildDashboard(),
    );
  }
}
