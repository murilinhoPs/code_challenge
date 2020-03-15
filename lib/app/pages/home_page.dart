import 'package:flutter/material.dart';
import 'package:tech_challenge/app/shared/components/animated_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20.0),
          height: 400,
          child: Stack(
            children: <Widget>[
              MyAnimatedWidget(
                startAlignment: Alignment.center,
                endAlignment: Alignment.center,
                title: 'Hello 2!',
                subtitle: '''Conteúdo sobre o bagulho....
                mais conteúdo...blá''',
              ),
              MyAnimatedWidget(
                startAlignment: Alignment.topCenter,
                endAlignment: Alignment.center,
                title: 'Hello 1!',
                subtitle: '''
                Conteúdo sobre o bagulho....
                mais conteúdo...blá''',
              ),
              MyAnimatedWidget(
                startAlignment: Alignment.bottomCenter,
                endAlignment: Alignment.center,
                title: 'Hello 3!',
                subtitle: '''
                Conteúdo sobre o bagulho....
                mais conteúdo...blá''',
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          width: 300,
          height: 150,
          child: Card(
            elevation: 8.0,
            child: Center(
              child: Text(
                'Card',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
        )
      ],
    );
  }
}
