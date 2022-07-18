import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Widgets/drawer.dart';
import 'package:new_app/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/tabacoteenmodel.dart';

class ObesityTeen extends StatefulWidget {
  const ObesityTeen({
    Key? key,
  }) : super(key: key);

  @override
  _ObesityTeenState createState() => _ObesityTeenState();
}

class _ObesityTeenState extends State<ObesityTeen> {
  List<DescriptionPageModel> ObesityTeenmodelQA =
      DescriptionPageModel.obesityPageModelQA;
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
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        drawer: DrawerWidget(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              snap: false,
              pinned: true,
              floating: false,

              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: const Text("Eating junk food is bad...But Why?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ) //TextStyle
                      ), //Text
                  background: Image.asset(
                    "assests/images/conifer-hamburger.png",
                    fit: BoxFit.cover,
                  ) //Images.network
                  ), //FlexibleSpaceBar
              expandedHeight: 230,
              backgroundColor: agegroup == 1
                  ? Color(0xFFFFE162)
                  : agegroup == 2
                      ? Color(0xFFFF8E00)
                      : agegroup == 3
                          ? Color(0xFF03256C)
                          : Color(0xFF03256C),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              // leading: IconButton(
              // icon: Icon(Icons.menu),
              // tooltip: 'Menu',
              // onPressed: () {},
              // ), //IconButton
              // actions: <Widget>[
              // IconButton(
              // 	icon: Icon(Icons.comment),
              // 	tooltip: 'Comment Icon',
              // 	onPressed: () {},
              // ), //IconButton
              // IconButton(
              // 	icon: Icon(Icons.settings),
              // 	tooltip: 'Setting Icon',
              // 	onPressed: () {},
              // ), //IconButton
              // ], //<Widget>[]
            ), //SliverAppBar
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ObesityTeenmodelQA[index].heading!,
                      SizedBox(
                        height: 10,
                      ),
                      ObesityTeenmodelQA[index].body!,
                    ],
                  ), //Center
                ), //ListTile
                childCount: ObesityTeenmodelQA.length,
              ), //SliverChildBuildDelegate
            ) //SliverList
          ], //<Widget>[]
        ),
      ),
    );
  }
}
