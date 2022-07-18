import 'package:flutter/material.dart';

import '../Models/tabacoteenmodel.dart';
import '../themes/styles.dart';
import 'drawer.dart';

class DashboardPageModel extends StatefulWidget {
  const DashboardPageModel(
      {Key? key,
      required this.headingText,
      required this.headingImagelink,
      required this.DescriptionPageModelQA})
      : super(key: key);
  final String headingText;
  final String headingImagelink;
  final List<DescriptionPageModel> DescriptionPageModelQA;
  @override
  State<DashboardPageModel> createState() => _DashboardPageModelState();
}

class _DashboardPageModelState extends State<DashboardPageModel> {
  late List<DescriptionPageModel> DescriptionPageModelQA;
  @override
  void initState() {
    setState(() {
      DescriptionPageModelQA = widget.DescriptionPageModelQA;
    });
    // TODO: implement initState
    super.initState();
  }

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
                collapseMode: CollapseMode.parallax,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.headingText,
                      style: DharamaAppTheme.headline //TextStyle
                      ),
                ), //Text
                background: Image.asset(
                  widget.headingImagelink,
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
    );
  }
}
