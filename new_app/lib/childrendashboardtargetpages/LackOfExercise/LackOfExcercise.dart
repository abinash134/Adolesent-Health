import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Widgets/dashboardpagemodel.dart';
import 'package:new_app/settings.dart';
import 'package:new_app/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/tabacoteenmodel.dart';
import '../../Widgets/drawer.dart';

class LackOfExcersice extends StatefulWidget {
  const LackOfExcersice({
    Key? key,
  }) : super(key: key);

  @override
  _LackOfExcersiceState createState() => _LackOfExcersiceState();
}

class _LackOfExcersiceState extends State<LackOfExcersice> {
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
        headingText: "Let's know what Lack Of Excersice causes to our body...",
        headingImagelink: "assests/images/lack_of_exercise.png",
        DescriptionPageModelQA: DescriptionPageModelQA);
  }
}
