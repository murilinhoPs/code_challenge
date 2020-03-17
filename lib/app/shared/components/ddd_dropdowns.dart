import 'package:flutter/material.dart';

class DddDropdown extends StatefulWidget {
  @override
  _DddDropdownState createState() => _DddDropdownState();
}

class _DddDropdownState extends State<DddDropdown> {
  List<String> _dddArray1 = ['011', '016', '017', '018'];
  List<String> _dddArray2 = ['011', '016', '017', '018'];

  String fromValue;
  String forValue;

  bool _active = false;

  _verifyDdd() {
    if (fromValue != forValue) {
      setState(() {
        _active = true;
      });
    } else {
      setState(() {
        _active = false;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'De: ',
                style: TextStyle(fontSize: 16),
              ),
              DropdownButton(
                value: fromValue,
                hint: Text('011'),
                underline: Container(
                  height: 1.5,
                  color: Colors.cyan,
                ),
                items: _dddArray1.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text('$value'),
                  );
                }).toList(),
                onChanged: (newValue) {
                  print('antes: $fromValue');
                  setState(() {
                    fromValue = newValue;

                    _verifyDdd();

                    print('depois: $fromValue');
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(width: 10.0),
        _active ? _interacbleDropdown() : _noInteracble()
      ],
    );
  }

  Widget _interacbleDropdown() {
    return Container(
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Para: ',
            style: TextStyle(fontSize: 16),
          ),
          DropdownButton(
            value: forValue,
            hint: Text('016'),
            underline: Container(
              height: 1.5,
              color: Colors.cyan,
            ),
            items: _dddArray2.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text('$value'),
              );
            }).toList(),
            onChanged: (newValue) {
              print('antes: $forValue');
              setState(() {
                forValue = newValue;

                _verifyDdd();

                print('depois: $forValue');
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _noInteracble() {
    final phoneWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 30.0,
      width: phoneWidth * 0.15,
      margin: EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        color: Colors.black54,
        backgroundBlendMode: BlendMode.multiply,
        border: Border(
          bottom: BorderSide(color: Colors.cyan),
        ),
      ),
      child: Row(
        children: <Widget>[
          DropdownMenuItem(
            value: '016',
            child: forValue != null ? Text('$forValue') : Text('016'),
          ),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
