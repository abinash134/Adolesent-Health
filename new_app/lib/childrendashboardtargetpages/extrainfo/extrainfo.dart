import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:new_app/childrendashboardtargetpages/extrainfo/extrainfo.dart';
import 'package:new_app/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/dashboradModel.dart';
import '../../Widgets/drawer.dart';
import '../TeenMaternity/teenMaternity.dart';
import 'extrainfoinsidepage/NGO.dart';
import 'extrainfoinsidepage/NGOforLGBTQ.dart';
import 'extrainfoinsidepage/helplinepage.dart';

class ExtraInfo extends StatefulWidget {
  const ExtraInfo({
    Key? key,
  }) : super(key: key);

  @override
  _ExtraInfoState createState() => _ExtraInfoState();
}

class _ExtraInfoState extends State<ExtraInfo> {
  List<Widget> listofPages = [
    NGOpage(),
    NGOforLGBTQpage(),
    HelplinePage(),

  ];

  @override
  void initState() {
    super.initState();

    getdata();
  }

  TextEditingController rangecontroller = TextEditingController();
  List<Dashboardmodel> dashboardItems = Dashboardmodel.extrainfocontent;
  ContainerTransitionType _containerTransitionType =
      ContainerTransitionType.fade;
  List<Widget> Listofwidget = [];
  String? name;

  getdata() async {
    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('name');
    setState(() {
      name = action;
    });
    Listofwidget.add(SizedBox(
      height: 10,
    ));
    Listofwidget.add(name != null
        ? Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: DharamaAppTheme.tilecolors,
            borderRadius: BorderRadius.circular(10.0)),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Image.asset(
                "assests/images/urban-mountains.png",
                height: 56,
                fit: BoxFit.fitHeight,
              ),
            ),
            // ListTile(
            //   tileColor: Colors.transparent,
            //   leading: const Icon(Icons.person),
            //   title: Text(
            //     'Hii ${name}',
            //     style: DharamaAppTheme.title,
            //   ),
            // ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hii ${name}',
                          style: DharamaAppTheme.title,
                        ),
                        Text(
                            "Let's see some NGOs working for Adolescent children"),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    )
        : const Text("Hello Child!"));
    Listofwidget.add(
      GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 8),
          itemCount: dashboardItems.length,
          itemBuilder: (BuildContext ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: OpenContainer(
                transitionType: _containerTransitionType,
                transitionDuration: Duration(milliseconds: 500),
                openBuilder: (context, _) => listofPages[index],
                closedElevation: 0,
                closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                        color: DharamaAppTheme.tilecolors, width: 2)),
                closedColor: DharamaAppTheme.tilecolors,
                closedBuilder: (context, _) => Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Image.asset(dashboardItems[index].imageUrl!),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: DharamaAppTheme.tilecolors,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                dashboardItems[index].name!,
                                style: DharamaAppTheme.title,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        backgroundColor: DharamaAppTheme.background,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: DharamaAppTheme.background,
          title: Text(
            'NGO',
            style: DharamaAppTheme.headline,
          ),
        ),
        drawer: DrawerWidget(),
        body: Stack(
          children: [
            // Center(
            //   child: Image.asset(
            //     "assests/images/backg.png",
            //     fit: BoxFit.cover,
            //     height: MediaQuery.of(context).size.height,
            //   ),
            // ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //name!=null?Text(name!):Text("Hello Child!"),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Listofwidget.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Listofwidget[index];
                          }),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Agegroup {
  String? text;
  Color? backgroundclr;
  int? groupvalue;

  Agegroup({this.text, this.backgroundclr, this.groupvalue});
}

// Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const BadPageForChildren()),
//                   );
