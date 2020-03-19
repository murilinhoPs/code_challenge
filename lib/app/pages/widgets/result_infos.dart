import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_challenge/app/app_module.dart';
import 'package:tech_challenge/app/shared/components/ddd_dropdowns.dart';
import 'package:tech_challenge/app/shared/components/minutes_form.dart';
import 'package:tech_challenge/app/shared/components/planos_drop.dart';
import 'package:tech_challenge/app/shared/controllers/bloc_controller.dart';
import 'package:tech_challenge/app/shared/global/price_bloc.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  MinDropdown _minutesPage = MinDropdown();

  PlanosDropdown _planosDropdown = PlanosDropdown();

  static DddDropdown _dddDropdown = DddDropdown();

  final _pricesBloc = AppModule.to.bloc<PriceBloc>();

  final _blocController = BlocController();

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          _dddDropdown,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _planosDropdown,
              _minutesPage,
              Container(
                width: 45.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    _blocController.verifyValues(context);
                  },
                  color: Colors.indigo[400],
                  child: Text('=',
                      style: GoogleFonts.ubuntuMono(
                        fontSize: 40,
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            height: phoneHeight * 0.095,
            width: phoneWidth * 0.85,
            decoration: BoxDecoration(color: Colors.cyan[700]),
            child: StreamBuilder<List<double>>(
                stream: _pricesBloc.priceSaida,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data[1] == 0)
                    return Text('Resultado',
                        style: GoogleFonts.baloo(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w200));
                  return Text(
                    '''Com FaleMais: ${snapshot.data[0]} Reais 
Sem FaleMais: ${snapshot.data[1]} Reais ''',
                    style: GoogleFonts.baloo(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
