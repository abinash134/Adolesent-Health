import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:new_app/themes/styles.dart';

import '../../../Models/activitiesModel.dart';
import 'activitydescription.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  ContainerTransitionType _containerTransitionType =
      ContainerTransitionType.fade;
  List<ActivityModel> Activities = ActivityModel.Activities;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DharamaAppTheme.background,
      appBar: AppBar(
        backgroundColor: DharamaAppTheme.appbar,
        centerTitle: true,
        title: Text("Activity"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Activities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OpenContainer(
                        transitionType: _containerTransitionType,
                        transitionDuration: Duration(milliseconds: 500),
                        openBuilder: (context, _) => ActivitydescriptionPage(
                          activitydata: Activities[index],
                        ),
                        closedElevation: 0,
                        closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: DharamaAppTheme.tilecolors, width: 2)),
                        closedColor: DharamaAppTheme.tilecolors,
                        closedBuilder: (context, _) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: DharamaAppTheme.tilecolors,
                          ),
                          child: Row(children: [
                            Image.asset(
                              "assests/images/experimental-boy-20.png",
                              height: 120,
                              width: 120,
                            ),
                            Text(
                              Activities[index].name,
                              style: DharamaAppTheme.title,
                            ),
                          ]),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
