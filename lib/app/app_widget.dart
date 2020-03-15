import 'package:flutter/material.dart';
import 'package:tech_challenge/app/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Title'), //Text('Orapma'),
        ),
        body: Center(
          child: MyHomePage(),
        ),
      ),
    );
  }
}
