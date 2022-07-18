import 'package:flutter/material.dart';
import 'package:new_app/parentwelcomepage/parentname.dart';
import 'package:new_app/themetemple.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ChildWelcomePage/entername.dart';
import '../parentwelcomepage/parenthowmanychild.dart';

class RoleDecider extends StatefulWidget {
  const RoleDecider({Key? key}) : super(key: key);

  @override
  _RoleDeciderState createState() => _RoleDeciderState();
}

class _RoleDeciderState extends State<RoleDecider> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              roletiles("Child"),
              roletiles("Parent"),
            ],
          ),
        ),
      ),
    );
  }

  Widget roletiles(String text) {
    return InkWell(
      onTap: () async {
        final prefs = await SharedPreferences.getInstance();
        if (text == "Child") {
          await prefs.setString("role", "Child");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EnterNameforChild()));
        } else if (text == "Parent") {
          await prefs.setString("role", "Parent");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PartentName()));
        }
      },
      child: Card(
        elevation: 5.0,
        child: Container(
          height: 120,
          width: 120,
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
