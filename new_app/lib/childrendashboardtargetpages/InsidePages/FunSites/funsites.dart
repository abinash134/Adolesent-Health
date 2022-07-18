import 'package:flutter/material.dart';

class FunSites extends StatefulWidget {
  const FunSites({Key? key}) : super(key: key);

  @override
  State<FunSites> createState() => _FunSitesState();
}

class _FunSitesState extends State<FunSites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FunSites"),
      ),
    );
  }
}
