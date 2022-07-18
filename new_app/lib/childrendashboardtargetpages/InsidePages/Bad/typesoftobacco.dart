import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:new_app/Models/typesoftobacco.dart';

class Typesoftobacco extends StatefulWidget {
  const Typesoftobacco({Key? key}) : super(key: key);

  @override
  _TypesoftobaccoState createState() => _TypesoftobaccoState();
}

class _TypesoftobaccoState extends State<Typesoftobacco> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Types of Tobacco'),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Column(
                  children: [
                    Image.asset(
                      "assests/images/smoking-solid.png",
                      height: 20,
                      width: 20,
                    ),
                    Text("Smoking Tobacco")
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Image.asset(
                      "assests/images/ban-smoking-solid.png",
                      height: 20,
                      width: 20,
                    ),
                    Text("Smokeless Tobacco")
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //test(),
            smokeingtobacco(
              lists: TypesofTobacco.Smokingtobacco,
            ),
            smokeingtobacco(
              lists: TypesofTobacco.smokelesstobacco,
            ),
          ],
        ),
      ),
    );
  }
}

class smokeingtobacco extends StatefulWidget {
  const smokeingtobacco({Key? key, required this.lists}) : super(key: key);
  final List<TypesofTobacco> lists;
  @override
  State<smokeingtobacco> createState() => _smokeingtobaccoState();
}

class _smokeingtobaccoState extends State<smokeingtobacco> {
  ContainerTransitionType _containerTransitionType =
      ContainerTransitionType.fade;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.lists.length,
              itemBuilder: (BuildContext context, int index) {
                return OpenContainer(
                  transitionType: _containerTransitionType,
                  transitionDuration: Duration(milliseconds: 500),
                  openBuilder: (context, _) => opentabacodescription(
                    des: widget.lists[index].description!,
                    title: widget.lists[index].name!,
                  ),
                  closedElevation: 0,
                  closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                      side: BorderSide(color: Colors.white, width: 1)),
                  closedColor: Colors.white,
                  closedBuilder: (context, _) => tobaccoCard(
                      des: widget.lists[index].description!,
                      title: widget.lists[index].name!,
                      imagelink: "assests/images/beedi.jpg"),
                );
              }),
        ],
      ),
    );
  }
}

class opentabacodescription extends StatelessWidget {
  const opentabacodescription(
      {Key? key, required this.des, required this.title})
      : super(key: key);
  final String des;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.asset("assests/images/beedi.jpg"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(des),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class tobaccoCard extends StatelessWidget {
  const tobaccoCard(
      {Key? key,
      required this.des,
      required this.title,
      required this.imagelink})
      : super(key: key);
  final String des;
  final String title;
  final String imagelink;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          subtitle: Column(
            children: [
              Text(
                des,
                maxLines: 5,
              ),
              Text(
                "View More",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          leading: Image.asset(imagelink),
          title: Text(title)),
    );
  }
}
