import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:new_app/ChildWelcomePage/childDashboard.dart';
import 'package:new_app/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themetemple.dart';

class SelectGender extends StatefulWidget {
  

  const SelectGender({Key? key,}) : super(key: key);

  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        
        
        body: SafeArea(
          child: SizedBox(
            child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              roletiles("Boy"),
              roletiles("Girl"),
            ],
          ),
        ),
          ),
        ),
        
      ),
    );
  }
  Widget roletiles(String text){
    return InkWell(
      onTap: () async {
        final prefs = await SharedPreferences.getInstance();
        if(text == "Boy"){
            await prefs.setString('gender',"Boy");
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChildDashboard()));
        }else if(text == "Girl"){
            await prefs.setString('gender',"Girl");
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
        }
                  
        
      },
      child: Card(
        
        elevation: 5.0,
        child: Container(
          height: 120,
          width: 120,
          child: Center(child: Text(text),
          ),
        ),
      ),
    );
  }
}