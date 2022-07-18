import 'package:flutter/material.dart';

class UsefulLinks extends StatefulWidget {
  const UsefulLinks({Key? key}) : super(key: key);

  @override
  State<UsefulLinks> createState() => _UsefulLinksState();
}

class _UsefulLinksState extends State<UsefulLinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UsefulLinks"),
      ),
    );
  }
}
