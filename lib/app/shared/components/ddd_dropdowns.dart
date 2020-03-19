import 'package:flutter/material.dart';
import 'package:tech_challenge/app/shared/controllers/bloc_controller.dart';
import 'package:tech_challenge/app/shared/global/ddd_bloc.dart';

import '../../app_module.dart';

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

  final _dddBloc = AppModule.to.bloc<DddBloc>();

  final _blocController = BlocController();

  _infoDdd() {
    if (forValue != null && fromValue != null)
      _blocController.addInfoDdd(dddFrom: fromValue, dddFor: forValue);
  }

  _verifyEqualsDdd() {
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
                hint: Text('DDD'),
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
                  //print('antes: $fromValue');
                  setState(() {
                    fromValue = newValue;

                    _verifyEqualsDdd();

                    //print('depois: $fromValue');
                  });
                  _dddBloc.verifyDdd(fromValue, _dddArray2);
                  _infoDdd();
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
            hint: Text('DDD'),
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
              //print('antes: $forValue');
              setState(() {
                forValue = newValue;

                _verifyEqualsDdd();

                //print('depois: $forValue');
              });
              _dddBloc.verifyDdd(forValue, _dddArray1);
              _infoDdd();
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
            value: 'DDD',
            child: forValue != null ? Text('$forValue') : Text('DDD'),
          ),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
