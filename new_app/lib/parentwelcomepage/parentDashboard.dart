import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:new_app/ChildWelcomePage/selectGender.dart';
import 'package:new_app/childrendashboardtargetpages/InsidePages/Bad/bad.dart';
import 'package:new_app/settings.dart';
import 'package:new_app/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/dashboradModel.dart';
import '../Widgets/drawer.dart';

class ParentDashboard extends StatefulWidget {
  const ParentDashboard({
    Key? key,
  }) : super(key: key);

  @override
  _ParentDashboardState createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  @override
  void initState() {
    super.initState();

    getdata();
  }

  TextEditingController rangecontroller = TextEditingController();
  List<Dashboardmodel> dashboardItems = Dashboardmodel.dashboardforparent;

  List<Widget> Listofwidget = [];
  String? name;

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
                  leading: const Icon(Icons.person),
                  title: Text('Hii ${name}'),
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
          itemCount: dashboardItems.length,
          itemBuilder: (BuildContext ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BadPageForChildren()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Image.asset("assests/images/taxi-robot-nanny.png"),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                dashboardItems[index].name!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
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
        appBar: AppBar(
          title: Text('DashBoard'),
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
