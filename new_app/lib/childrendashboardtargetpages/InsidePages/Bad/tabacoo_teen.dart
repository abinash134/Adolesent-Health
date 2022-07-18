import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Models/tabacoteenmodel.dart';
import 'package:new_app/Widgets/drawer.dart';
import 'package:new_app/settings.dart';
import 'package:new_app/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabacooTeen extends StatefulWidget {
  const TabacooTeen({
    Key? key,
  }) : super(key: key);

  @override
  _TabacooTeenState createState() => _TabacooTeenState();
}

class _TabacooTeenState extends State<TabacooTeen> {
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
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text("Tobacco is bad...But Why?",
                        style: DharamaAppTheme.headline //TextStyle
                        ),
                  ), //Text
                  background: Image.asset(
                    "assests/images/cherry-582.png",
                    fit: BoxFit.cover,
                  ) //Images.network
                  ), //FlexibleSpaceBar
              expandedHeight: 230,
              backgroundColor: DharamaAppTheme.appbar,
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
                      DescriptionPageModelQA[index].heading!,
                      SizedBox(
                        height: 10,
                      ),
                      DescriptionPageModelQA[index].body!,
                    ],
                  ), //Center
                ), //ListTile
                childCount: DescriptionPageModelQA.length,
              ), //SliverChildBuildDelegate
            ) //SliverList
          ], //<Widget>[]
        ),
      ),
    );
  }
}
