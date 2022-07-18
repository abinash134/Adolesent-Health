import 'package:flutter/material.dart';

import '../../../themes/styles.dart';

class NGOforLGBTQpage extends StatefulWidget {
  const NGOforLGBTQpage({Key? key}) : super(key: key);

  @override
  State<NGOforLGBTQpage> createState() => _NGOforLGBTQpageState();
}

class _NGOforLGBTQpageState extends State<NGOforLGBTQpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DharamaAppTheme.background,
      appBar: AppBar(
        title: Text("Helpline Page"),
      ),
    );
  }
}
