import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:new_app/ChildWelcomePage/selectageRange.dart';
import 'package:new_app/parentwelcomepage/parenthowmanychild.dart';
import 'package:new_app/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themetemple.dart';

class PartentName extends StatefulWidget {
  const PartentName({
    Key? key,
  }) : super(key: key);

  @override
  _PartentNameState createState() => _PartentNameState();
}

class _PartentNameState extends State<PartentName> {
  TextEditingController _namecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _namecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter your name',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString(
                            'parentname', _namecontroller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChildrenNo()));
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
