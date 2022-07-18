import 'package:flutter/material.dart';
import 'package:new_app/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ChildWelcomePage/newwelcomePage.dart';
import '../datainputpages/chooseRole.dart';
import '../settings.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isloggingout = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: DharamaAppTheme.appbar,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset(
              "assests/images/marginalia-775.png",
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
              onTap: () async {
                setState(() {
                  isloggingout = true;
                });
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                setState(() {
                  isloggingout = false;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewWelcomePageForChildren()),
                );
              },
              leading: isloggingout
                  ? CircularProgressIndicator()
                  : Icon(Icons.logout),
              title: isloggingout ? Text('Logging out') : Text('Logout')),
        ],
      ),
    );
  }
}
