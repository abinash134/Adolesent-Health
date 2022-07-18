import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Models/helplineModel.dart';

class DetailPage extends StatelessWidget {
  final Helpline lesson;

  DetailPage({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: 50,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final coursePrice = GridView.builder(
        // scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: lesson.location!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 20,
            width: 50,
            padding: const EdgeInsets.all(7.0),
            decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5.0)),
            child: Container(
              child: Text(
                lesson.location![index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });

    final topContentText = SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40.0),
          // Container(
          //   width: 90.0,
          //   child: new Divider(color: Colors.green),
          // ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              lesson.name!,
              style: TextStyle(color: Colors.white, fontSize: 45.0),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 300,
              child: GridView.builder(
                  // scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: lesson.location!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(2.0),
                        decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Container(
                          height: 50,
                          width: 80,
                          child: Text(
                            lesson.location![index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          //coursePrice,
        ],
      ),
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.fromLTRB(40, 40, 40, 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: topContentText,
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      lesson.description!,
      style: TextStyle(fontSize: 18.0),
    );
    final callButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () async {
            final Uri launchUri = Uri(
              scheme: 'tel',
              path: lesson.number!,
            );
            await launchUrl(
              launchUri,
              mode: LaunchMode.platformDefault,
            );
          },
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Text("Call", style: TextStyle(color: Colors.white)),
        ));
    final webButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () async {
            if (!await launchUrl(Uri.parse(lesson.website!),
                mode: LaunchMode.externalApplication))
              throw 'Could not launch $lesson.website!';
          },
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Text("Visit Site", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, callButton, webButton],
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent, bottomContent],
        ),
      ),
    );
  }
}
