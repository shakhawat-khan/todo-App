import 'package:flutter/material.dart';

import 'appBar.dart';
import 'body.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: (MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}
