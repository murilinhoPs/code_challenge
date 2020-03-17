import 'package:flutter/material.dart';

class PlanosDropdown extends StatefulWidget {
  @override
  _PlanosDropdownState createState() => _PlanosDropdownState();
}

class _PlanosDropdownState extends State<PlanosDropdown> {
  final List<String> _planosArray = [
    'Fale Mais 30',
    'Fale Mais 60',
    'Fale Mais 120'
  ];

  String _dropdownValue;
  int dropdownToInt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: DropdownButton<String>(
        value: _dropdownValue,
        hint: Text('escolha o plano'),
        underline: Container(
          height: 1.5,
          color: Colors.cyan,
        ),
        items: _planosArray.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text('$value'),
          );
        }).toList(),
        onChanged: (String newValue) {
          print('antes: $_dropdownValue');
          setState(() {
            _dropdownValue = newValue;

            print('depois: $_dropdownValue');
          });

          _setValueToInt();
        },
      ),
    );
  }

  _setValueToInt() {
    switch (_dropdownValue) {
      case 'Fale Mais 30':
        dropdownToInt = 30;
        break;
      case 'Fale Mais 60':
        dropdownToInt = 60;
        break;
      case 'Fale Mais 120':
        dropdownToInt = 120;
        break;
    }

    print('planoIntLocal: $dropdownToInt');
  }
}
