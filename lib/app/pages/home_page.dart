import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_challenge/app/pages/widgets/result_infos.dart';
import 'package:tech_challenge/app/shared/components/animated_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _planos(context),
        SizedBox(height: 10.0),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          width: 300,
          height: 200,
          child: Card(
            elevation: 8.0,
            child: Center(
              child: FormPage(),
            ),
          ),
        )
      ],
    );
  }

  Widget _planos(context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 400,
      child: Stack(
        children: <Widget>[
          MyAnimatedWidget(
            startAlignment: Alignment.center,
            endAlignment: Alignment.center,
            title: 'Fale Mais 60',
            custo: '59,99 reais',
            internet: '3.5 Gb',
            sms: 'Ilimitado',
            appsIlimitados: Container(),
          ),
          MyAnimatedWidget(
            startAlignment: Alignment.topCenter,
            endAlignment: Alignment.center,
            title: 'Fale Mais 30',
            custo: '49,99 reais',
            internet: '2 Gb',
            sms: '100 por dia',
            appsIlimitados: Container(),
          ),
          MyAnimatedWidget(
            startAlignment: Alignment.bottomCenter,
            endAlignment: Alignment.center,
            title: 'Fale Mais 120',
            custo: '79,99 reais',
            internet: '5 Gb',
            sms: 'SMS Ilimitado',
            appsIlimitados: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'App ilimitado',
                  style: GoogleFonts.baloo(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        style: BorderStyle.none, color: Colors.transparent),
                  ),
                  width: 40,
                  height: 40,
                  child: Image.asset('assets/wpp.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
