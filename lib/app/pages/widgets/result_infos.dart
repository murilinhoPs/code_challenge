import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_challenge/app/shared/components/ddd_dropdowns.dart';
import 'package:tech_challenge/app/shared/components/minutes_form.dart';
import 'package:tech_challenge/app/shared/components/planos_drop.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  static MinDropdown _minutesPage = MinDropdown();
  var _minutesInfo = _minutesPage.createState().dropdownValue;

  static PlanosDropdown _planosDropdown = PlanosDropdown();
  var _planosInfo = _planosDropdown.createState().dropdownToInt;

  static DddDropdown _dddDropdown = DddDropdown();
  var _dddFromInfo = _dddDropdown.createState().fromValue;
  var _dddForInfo = _dddDropdown.createState().forValue;

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    print('min: $_minutesInfo');
    print('planoInt: $_planosInfo');
    print('fromDdd: $_dddFromInfo');
    print('forDdd: $_dddForInfo');

    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          DddDropdown(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _planosDropdown,
              _minutesPage,
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            height: phoneHeight * 0.05,
            width: phoneWidth * 0.6,
            decoration: BoxDecoration(color: Colors.cyan),
            child: Text(
              'Resultado',
              style: GoogleFonts.baloo(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w200),
            ),
          ),
        ],
      ),
    );
  }
}
