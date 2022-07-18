import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:new_app/ChildWelcomePage/selectGender.dart';
import 'package:new_app/Widgets/drawer.dart';
import 'package:new_app/childrendashboardtargetpages/InsidePages/Bad/obesityteen.dart';

import 'package:new_app/settings.dart';
import 'package:new_app/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/dashboradModel.dart';
import 'tabacoo_teen.dart';

class BadPageForChildren extends StatefulWidget {
  const BadPageForChildren({
    Key? key,
  }) : super(key: key);

  @override
  _BadPageForChildrenState createState() => _BadPageForChildrenState();
}

class _BadPageForChildrenState extends State<BadPageForChildren> {
  TextEditingController rangecontroller = TextEditingController();
  List<Dashboardmodel> badpagecontents = Dashboardmodel.badpagecontents;
  ContainerTransitionType _containerTransitionType =
      ContainerTransitionType.fade;
  List<Widget> ListofPages = [
    TabacooTeen(),
    ObesityTeen(),
  ];
  List<Widget> Listofwidget = [];
  String? name;
  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('name');
    setState(() {
      name = action;
    });
    Listofwidget.add(name != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                    "assests/images/icons8-warning-64.png",
                    height: 30,
                    width: 30,
                  ),
                  title: Text("Don't Do this"),
                ),
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
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: badpagecontents.length,
          itemBuilder: (BuildContext ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: OpenContainer(
                transitionType: _containerTransitionType,
                transitionDuration: Duration(milliseconds: 500),
                openBuilder: (context, _) => ListofPages[index],
                closedElevation: 0,
                closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                        color: DharamaAppTheme.tilecolors, width: 1)),
                closedColor: DharamaAppTheme.tilecolors,
                closedBuilder: (context, _) => Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Image.asset(badpagecontents[index].imageUrl!),
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
                                badpagecontents[index].name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: DharamaAppTheme.tilecolors,
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
        appBar: AppBar(
          backgroundColor: DharamaAppTheme.appbar,
          centerTitle: true,
          title: Text(
            'Bad',
            style: DharamaAppTheme.headline,
          ),
        ),
        drawer: DrawerWidget(),
        body: SingleChildScrollView(
          child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              //name!=null?Text(name!):Text("Hello Child!"),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount: Listofwidget.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Listofwidget[index];
                  }),
            ]),
          ),
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
//                         builder: (context) => const TabacooTeen()),
//                   );