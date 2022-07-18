import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Widgets/dashboardpagemodel.dart';
import 'package:new_app/settings.dart';
import 'package:new_app/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/tabacoteenmodel.dart';
import '../../Widgets/drawer.dart';

class TeenMaternity extends StatefulWidget {
  const TeenMaternity({
    Key? key,
  }) : super(key: key);

  @override
  _TeenMaternityState createState() => _TeenMaternityState();
}

class _TeenMaternityState extends State<TeenMaternity> {
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
        headingText: "Let's know why teen pregnancy is bad...",
        headingImagelink: "assests/images/pregnancy.png",
        DescriptionPageModelQA: DescriptionPageModelQA);
  }
}
