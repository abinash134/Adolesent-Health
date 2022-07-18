import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:new_app/ChildWelcomePage/selectageRange.dart';
import 'package:new_app/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themetemple.dart';

class EnterNameforChild extends StatefulWidget {
  const EnterNameforChild({
    Key? key,
  }) : super(key: key);

  @override
  _EnterNameforChildState createState() => _EnterNameforChildState();
}

class _EnterNameforChildState extends State<EnterNameforChild> {
  TextEditingController _namecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
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
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                          ),
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
                        await prefs.setString('name', _namecontroller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectAgeRange()));
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
