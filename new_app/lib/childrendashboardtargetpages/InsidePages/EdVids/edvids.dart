import 'package:flutter/material.dart';

class Edvids extends StatefulWidget {
  const Edvids({Key? key}) : super(key: key);

  @override
  State<Edvids> createState() => _EdvidsState();
}

class _EdvidsState extends State<Edvids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edvids"),
      ),
    );
  }
}
