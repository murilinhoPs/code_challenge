import 'package:flutter/material.dart';
import 'package:tech_challenge/app/shared/controllers/bloc_controller.dart';

class MinDropdown extends StatefulWidget {
  @override
  _MinDropdownState createState() => _MinDropdownState();
}

class _MinDropdownState extends State<MinDropdown> {
  var _minutesArray = <int>[
    1,
    5,
    10,
    15,
    20,
    40,
    50,
    75,
    80,
    100,
    115,
    120,
    150,
    170,
    195,
    200
  ];

  int dropdownValue;

  final _blocController = BlocController();

  _infoMin() {
    if (dropdownValue != null) {
      _blocController.addInfoMin(dropdownValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: DropdownButton<int>(
        value: dropdownValue,
        hint: Text('tempo'),
        underline: Container(
          height: 1.5,
          color: Colors.cyan,
        ),
        items: _minutesArray.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text('$value'),
          );
        }).toList(),
        onChanged: (int newValue) {
          //print('antes: $dropdownValue');
          setState(() {
            dropdownValue = newValue;

            _infoMin();

            //print('depois: $dropdownValue');
          });
        },
      ),
    );
  }
}
