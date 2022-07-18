import 'package:flutter/material.dart';
import 'package:new_app/Widgets/dashboardpagemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/tabacoteenmodel.dart';

class UseOfTobacco extends StatefulWidget {
  const UseOfTobacco({
    Key? key,
  }) : super(key: key);

  @override
  _UseOfTobaccoState createState() => _UseOfTobaccoState();
}

class _UseOfTobaccoState extends State<UseOfTobacco> {
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
        headingText: "Tobacco is bad...But Why?",
        headingImagelink: "assests/images/cherry-582.png",
        DescriptionPageModelQA: DescriptionPageModelQA);
  }
}
