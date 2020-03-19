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
          centerTitle: true,
          title: Container(
            height: 55.0,
            child: Image.asset('assets/orapma.png'),
          ), //Text('Orapma'),
        ),
        body: Center(
          child: MyHomePage(),
        ),
      ),
    );
  }
}
