import 'package:flutter/material.dart';
import 'package:new_app/ChildWelcomePage/selectageRange.dart';
import 'package:new_app/parentwelcomepage/parentDashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChildrenNo extends StatefulWidget {
  const ChildrenNo({Key? key}) : super(key: key);

  @override
  _ChildrenNoState createState() => _ChildrenNoState();
}

class _ChildrenNoState extends State<ChildrenNo> {
  TextEditingController _namecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          return 'Please enter a number';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'No Of Children',
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
                      await prefs.setString('noofchild', _namecontroller.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ParentDashboard()));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
