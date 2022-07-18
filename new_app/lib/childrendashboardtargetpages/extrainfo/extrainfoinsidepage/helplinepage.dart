import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Models/helplineModel.dart';
import '../../../themes/styles.dart';
import 'detailedhelplinepage.dart';

class HelplinePage extends StatefulWidget {
  const HelplinePage({Key? key}) : super(key: key);

  @override
  State<HelplinePage> createState() => _HelplinePageState();
}

class _HelplinePageState extends State<HelplinePage> {
  late List data;
  late Helplinedata helplinedata;

  loadJsonData() async {
    var jsonText =
        await rootBundle.loadString('assests/JSON data/helpline.json');
    setState(() => helplinedata = helplinedataFromJson(jsonText));
    print(helplinedata.helpline![0].name);
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black87,
      appBar: AppBar(
        title: Text("Helpline Page"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: helplinedata.helpline!.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: card(helplinedata.helpline![index]),
            );
          }),
    );
  }

  // Widget card(Helpline helplinedata){
  //   var size = MediaQuery.of(context).size;
  //   var height = size.height;
  //   var width = size.width;
  //   return Container(
  //     width: width,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(5.0),
  //     ),
  //     child:Column(
  //       children: [
  //         Flexible(
  //           child: Padding(
  //             padding: const EdgeInsets.fromLTRB(4.0, 2.0, 2.0, 3.0),
  //             child: Text(helplinedata.name!,style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 20.0,
  //               fontWeight: FontWeight.bold,
  //             ),),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(4.0, 2.0, 2.0, 3.0),
  //           child: Text(helplinedata.description!,style: TextStyle(
  //             color: Colors.black54,
  //             fontSize: 20.0,
  //             fontWeight: FontWeight.bold,
  //           ),),
  //         ),
  //         SizedBox(height: 10,),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(4.0),
  //               child: Padding(
  //                 padding: const EdgeInsets.fromLTRB(8.0, 2.0, 2.0, 3.0),
  //                 child: InkWell(
  //                   onTap: ()async{
  //                     final Uri launchUri = Uri(
  //                       scheme: 'tel',
  //                       path: helplinedata.number!,
  //                     );
  //                     await launchUrl(launchUri,mode: LaunchMode.platformDefault,);
  //                   },
  //                   child: Row(
  //                     children: [
  //                       Icon(Icons.call,color: Colors.green,),
  //                       Padding(
  //                         padding: const EdgeInsets.all(4.0),
  //                         child: Text(helplinedata.number!,style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 20.0,
  //                           fontWeight: FontWeight.bold,
  //                         ),),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding:const EdgeInsets.fromLTRB(4.0, 2.0, 2.0, 3.0),
  //               child: InkWell(
  //                 onTap: ()async{
  //                   if (!await launchUrl(Uri.parse(helplinedata.website!),mode: LaunchMode.externalApplication))throw 'Could not launch $helplinedata.website!';
  //                 },
  //                 child: Row(
  //                   children: [
  //                     Icon(
  //                       Icons.language_outlined,
  //                       color: Colors.blue,
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.all(4.0),
  //                       child: Text("Visit Website",style: TextStyle(
  //                         color: Colors.black,
  //                         fontSize: 20.0,
  //                         fontWeight: FontWeight.bold,
  //                       ),),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //
  //       ],
  //     ) ,
  //   );
  // }
  Widget card(Helpline helplinedata) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DetailPage(lesson: helplinedata,)),
        );
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Color.fromRGBO(58, 66, 86, 1.0),
          ),
          height: height/3.8,

          child: Row(
            children: [
              Expanded(
                child: Image.network(
                  helplinedata.imgurl!,
                  width: 220,
                  height: 220,
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 6,
                        child: ListTile(
                          title: Text(
                            helplinedata.name!,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            helplinedata.description!,
                            maxLines: 10,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.green,
                                  ),
                                  Text("Call"),
                                ],
                              ),
                              onPressed: () async {
                                final Uri launchUri = Uri(
                                  scheme: 'tel',
                                  path: helplinedata.number!,
                                );
                                await launchUrl(
                                  launchUri,
                                  mode: LaunchMode.platformDefault,
                                );
                              },
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            TextButton(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.language_outlined,
                                    color: Colors.blue,
                                  ),
                                  Text("Visit Site"),
                                ],
                              ),
                              onPressed: () async {
                                if (!await launchUrl(
                                    Uri.parse(helplinedata.website!),
                                    mode: LaunchMode.externalApplication))
                                  throw 'Could not launch $helplinedata.website!';
                              },
                            ),
                            SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                flex: 8,
              ),
            ],
          ),
        ),
        elevation: 8,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
