import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Widgets/dashboardpagemodel.dart';
import 'package:new_app/settings.dart';
import 'package:new_app/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/tabacoteenmodel.dart';
import '../../Widgets/drawer.dart';

class Injuries extends StatefulWidget {
  const Injuries({
    Key? key,
  }) : super(key: key);

  @override
  _InjuriesState createState() => _InjuriesState();
}

class _InjuriesState extends State<Injuries> {
  List<DescriptionPageModel> DescriptionPageModelQA =
      DescriptionPageModel.tabacooteenPageModelQA;
  late int agegroup = 0;
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  getdata() async {
    final prefs = await SharedPreferences.getInstance();
    final int? age = prefs.getInt('agerange');
    setState(() {
      agegroup = age!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DashboardPageModel(
        headingText: "Let's know how to prevent injury...",
        headingImagelink: "assests/images/injury.png",
        DescriptionPageModelQA: DescriptionPageModelQA);
  }
}
