import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:new_app/ChildWelcomePage/selectGender.dart';
import 'package:new_app/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectAgeRange extends StatefulWidget {
  const SelectAgeRange({
    Key? key,
  }) : super(key: key);

  @override
  _SelectAgeRangeState createState() => _SelectAgeRangeState();
}

class _SelectAgeRangeState extends State<SelectAgeRange> {
  TextEditingController rangecontroller = TextEditingController();
  List<Agegroup> ageGroupList = [
    Agegroup(
      text: "Age 10 - 12",
      backgroundclr: Color(0xFFFFE162),
      groupvalue: 1,
    ),
    Agegroup(
      text: "Age 13 - 15",
      backgroundclr: Color(0xFFFF8E00),
      groupvalue: 2,
    ),
    Agegroup(
      text: "Age 15 - 19",
      backgroundclr: Color(0xFF03256C),
      groupvalue: 3,
    ),
  ];
  List<Widget> Listofwidget = [];
  String? name;
  @override
  void initState() {
    // TODO: implement initState
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
                alignment: Alignment.center, child: Text("Hii ${name!}")),
          )
        : Text("Hello Child!"));
    Listofwidget.add(
      ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: ageGroupList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () async {
                //SelectGender
                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt('agerange', ageGroupList[index].groupvalue!);
                // if (ageGroupList[index].groupvalue == 1) {
                //   AdaptiveTheme.of(context).setTheme(
                //     light: ThemeData(
                //       colorScheme: ColorScheme.fromSwatch().copyWith(
                //         brightness: Brightness.light,
                //         primary: const Color(0xFFFFE162),
                //         secondary: const Color(0xFF219F94),
                //       ),
                //     ),
                //     dark: ThemeData(
                //       colorScheme: ColorScheme.fromSwatch().copyWith(
                //         brightness: Brightness.dark,
                //         primary: const Color(0xFFFFE162),
                //         secondary: const Color(0xFF219F94),
                //       ),
                //     ),
                //     notify: true,
                //   );
                // }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectGender()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .25,
                  color: ageGroupList[index].backgroundclr,
                  child: Center(child: Text("${ageGroupList[index].text}")),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //name!=null?Text(name!):Text("Hello Child!"),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
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
