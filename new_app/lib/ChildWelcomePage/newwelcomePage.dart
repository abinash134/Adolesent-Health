import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_app/ChildWelcomePage/childDashboard.dart';
import 'package:new_app/themes/styles.dart';
import 'package:new_app/themetemple.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The demo page for [SharedAxisPageTransitionsBuilder].
class NewWelcomePageForChildren extends StatefulWidget {
  /// Creates the demo page for [SharedAxisPageTransitionsBuilder].
  const NewWelcomePageForChildren({Key? key}) : super(key: key);

  @override
  _NewWelcomePageForChildrenState createState() {
    return _NewWelcomePageForChildrenState();
  }
}

class _NewWelcomePageForChildrenState extends State<NewWelcomePageForChildren> {
  SharedAxisTransitionType? _transitionType = SharedAxisTransitionType.scaled;
  bool _isLoggedIn = true;
  int pageNo = 1;
  bool atthestart = true;
  bool attheend = false;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2001, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void showsnacbar(String content) {
    var snackBar = SnackBar(
      content: Text('Please enter valid data'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _updateTransitionType(SharedAxisTransitionType? newType) {
    setState(() {
      _transitionType = newType;
    });
  }

  void _toggleLoginStatusplus() {
    if (pageNo < 5) {
      setState(() {
        //_isLoggedIn = !_isLoggedIn;
        pageNo = pageNo + 1;
        atthestart = false;
        attheend = false;
      });
    } else {
      setState(() {
        attheend = true;
      });
    }
  }

  void _toggleLoginStatusminus() {
    if (pageNo > 1) {
      setState(() {
        //_isLoggedIn = !_isLoggedIn;
        pageNo = pageNo - 1;
        atthestart = false;
        attheend = false;
      });
    } else {
      setState(() {
        atthestart = true;
      });
    }
  }

  Future<bool> validator() async {
    print(pageNo);
    print("=in validator");
    switch (pageNo) {
      case 1:
        {
          if (!_SignInPage.name.text.isEmpty) {
            print("returning true");
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('name', _SignInPage.name.text);
            print(_SignInPage.name.text);
            return true;
          } else {
            print("returning false");
            return false;
          }
        }
        break;

      case 2:
        {
          if (_AgetakerState.agecontroller.text != null) {
            final prefs = await SharedPreferences.getInstance();

            DateTime DOB = DateTime.parse(_AgetakerState.agecontroller.text);
            final date2 = DateTime.now();
            int difference = date2.difference(DOB).inDays;
            if (difference > 3650) {
              if (difference > 3650 && difference < 4745) {
                await prefs.setInt('agerange', 1);
              } else if (difference >= 4745 && difference < 5475) {
                await prefs.setInt('agerange', 2);
              } else {
                await prefs.setInt('agerange', 3);
              }
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        }
        break;

      case 3:
        {
          if (_gender.boyisselected != false ||
              _gender.girlisselected != false) {
            final prefs = await SharedPreferences.getInstance();
            if (_gender.boyisselected) {
              await prefs.setString('gender', "Boy");
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChildDashboard()));
            } else {
              await prefs.setString('gender', "Girl");
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChildDashboard()));
            }
            return true;
          } else {
            return false;
          }
        }
        break;

      case 4:
        {
          if (_SignInPage.name != null) {
            return true;
          } else {
            return false;
          }
        }
        break;

      default:
        {
          if (_SignInPage.name != null) {
            return true;
          } else {
            return false;
          }
        }
        break;
    }
  }

  Widget pageDecider() {
    switch (pageNo) {
      case 1:
        {
          return _SignInPage();
        }
        break;

      case 2:
        {
          return Agetaker();
        }
        break;

      case 3:
        {
          return _gender();
        }
        break;

      case 4:
        {
          return _CoursePage();
        }
        break;

      default:
        {
          return _SignInPage();
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageTransitionSwitcher(
                duration: const Duration(milliseconds: 300),
                reverse: true,
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return SharedAxisTransition(
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: _transitionType!,
                  );
                },
                child: pageDecider(),
              ),
            ),
            Container(
              color: DharamaAppTheme.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: !atthestart
                            ? () {
                                _toggleLoginStatusminus();
                                print(pageNo);
                              }
                            : null,
                        child: const Text('BACK'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          print("next");
                          if (await validator()) {
                            if (!attheend) {
                              _toggleLoginStatusplus();
                            } else {
                              null;
                            }
                          } else {
                            showsnacbar("Some data");
                          }
                        },
                        child: const Text('NEXT'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        Text(
          'Streamling your courses',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Bundled categories appear as groups in your feed. '
            'You can always change this later.',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const _CourseSwitch(course: 'Arts & Crafts'),
        const _CourseSwitch(course: 'Business'),
        const _CourseSwitch(course: 'Illustration'),
        const _CourseSwitch(course: 'Design'),
        const _CourseSwitch(course: 'Culinary'),
      ],
    );
  }
}

class _CourseSwitch extends StatefulWidget {
  const _CourseSwitch({
    required this.course,
  });

  final String course;

  @override
  _CourseSwitchState createState() => _CourseSwitchState();
}

class _CourseSwitchState extends State<_CourseSwitch> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    final String subtitle = _value ? 'Bundled' : 'Shown Individually';
    return SwitchListTile(
      title: Text(widget.course),
      subtitle: Text(subtitle),
      value: _value,
      onChanged: (bool newValue) {
        setState(() {
          _value = newValue;
        });
      },
    );
  }
}

class _SignInPage extends StatelessWidget {
  static TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxHeight = constraints.maxHeight;
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: DharamaAppTheme.grey,
            ),
            Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(vertical: maxHeight / 20)),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                Text(
                  'Hi',
                  style: DharamaAppTheme.display1,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                const Text('Please Enter Your Name',
                    style: DharamaAppTheme.title),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: maxHeight / 20)),
                Image.asset(
                  "assests/images/nameimg.png",
                  height: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                        left: 15.0,
                        right: 15.0,
                        bottom: 10.0,
                      ),
                      child: TextField(
                        controller: name,
                        decoration: const InputDecoration(
                            focusColor: Colors.black,
                            isDense: true,
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class Agetaker extends StatefulWidget {
  @override
  State<Agetaker> createState() => _AgetakerState();
}

class _AgetakerState extends State<Agetaker> {
  DateTime selectedDate = DateTime.now();
  static TextEditingController agecontroller = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2001, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(picked);
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        print(formatter.format(picked));
        agecontroller.text = formatter.format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxHeight = constraints.maxHeight;
        return Stack(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: DharamaAppTheme.grey,
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(vertical: maxHeight / 20)),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                Text(
                  'Hi ${_SignInPage.name.text}',
                  style: DharamaAppTheme.display1,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
                const Text('Enter Your Date Of Birth',
                    style: DharamaAppTheme.title),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: maxHeight / 20)),
                Image.asset(
                  'assests/images/dateimg.png',
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                        left: 15.0,
                        right: 15.0,
                        bottom: 10.0,
                      ),
                      child: TextField(
                        controller: agecontroller,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: Icon(
                                Icons.calendar_today_rounded,
                                size: 20,
                                color: Colors.black54,
                              ),
                            ),
                            isDense: true,
                            labelText: 'DD/MM/YYYY',
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _gender extends StatefulWidget {
  static TextEditingController name = TextEditingController();
  static bool boyisselected = false;
  static bool girlisselected = false;
  @override
  State<_gender> createState() => _genderState();
}

class _genderState extends State<_gender> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxHeight = constraints.maxHeight;
        return Scaffold(
          body: Stack(
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: DharamaAppTheme.grey,
                ),
              ),
              SafeArea(
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
            ],
          ),
        );
      },
    );
  }

  Widget roletiles(String text) {
    return Stack(
      children: [
        text == "Boy"
            ? Image.asset(
                "assests/images/experimental-boy-20.png",
                height: 400,
                width: 150,
              )
            : Image.asset(
                "assests/images/experimental-girl-26.png",
                height: 400,
                width: 150,
              ),
        Positioned(
          bottom: 100,
          child: InkWell(
            onTap: () async {
              if (text == "Boy") {
                setState(() {
                  _gender.boyisselected = true;
                  _gender.girlisselected = false;
                });
                // await prefs.setString('gender', "Boy");
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const ChildDashboard()));
              } else if (text == "Girl") {
                setState(() {
                  _gender.boyisselected = false;
                  _gender.girlisselected = true;
                });
                // await prefs.setString('gender', "Girl");
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const ChildDashboard()));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: text == "Boy"
                    ? _gender.boyisselected
                        ? DharamaAppTheme.nearlyBlue
                        : DharamaAppTheme.nearlyWhite
                    : _gender.girlisselected
                        ? DharamaAppTheme.nearlyBlue
                        : DharamaAppTheme.nearlyWhite,
              ),
              height: 120,
              width: 120,
              child: Center(
                child: Text(text,style: TextStyle(color: Colors.black87),),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
