import 'package:flutter/material.dart';
import 'package:new_app/Models/activitiesModel.dart';
import 'package:new_app/themes/styles.dart';

import '../../../Widgets/drawer.dart';

class ActivitydescriptionPage extends StatelessWidget {
  const ActivitydescriptionPage({Key? key, required this.activitydata})
      : super(key: key);
  final ActivityModel activitydata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: true,
            floating: false,

            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(activitydata.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ) //TextStyle
                    ), //Text
                background: Image.asset(
                  "assests/images/experimental-boy-20.png",
                  fit: BoxFit.cover,
                ) //Images.network
                ), //FlexibleSpaceBar
            expandedHeight: 230,
            backgroundColor: DharamaAppTheme.tilecolors,
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(activitydata.description),
                  ],
                ), //Center
              ), //ListTile
              childCount: 1,
            ), //SliverChildBuildDelegate
          ) //SliverList
        ], //<Widget>[]
      ),
    );
  }
}
