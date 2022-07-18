import 'package:flutter/material.dart';

import '../../../themes/styles.dart';

class NGOpage extends StatefulWidget {
  const NGOpage({Key? key}) : super(key: key);

  @override
  State<NGOpage> createState() => _NGOpageState();
}

class _NGOpageState extends State<NGOpage> {
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
