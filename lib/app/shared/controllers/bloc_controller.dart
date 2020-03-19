import 'package:tech_challenge/app/shared/global/ddd_bloc.dart';
import 'package:tech_challenge/app/shared/global/minutes_bloc.dart';
import 'package:tech_challenge/app/shared/global/planos_bloc.dart';
import 'package:tech_challenge/app/shared/global/price_bloc.dart';
import 'package:toast/toast.dart';

import '../../app_module.dart';

class BlocController {
  //BLOCS
  final _minBloc = AppModule.to.bloc<MinutesBloc>();
  final _plansBloc = AppModule.to.bloc<PlansBloc>();
  final _dddBloc = AppModule.to.bloc<DddBloc>();
  final _pricesBloc = AppModule.to.bloc<PriceBloc>();

  var _normalTaxes;
  var _plusTaxes;

  int semPlano;
  int comPlano;

  verifyValues(context) {
    if (_plansBloc.planValue != null &&
        _minBloc.minValue != null &&
        _dddBloc.dddValue != null) {
      print('prossegur');
      _verifyDddAgain(_dddBloc.dddValue, context);
    } else {
      print('Preencha todos os campos');
      Toast.show('Preencha todos os campos', context, duration: 5);
    }
  }

  _verifyDddAgain(dddValue, context) {
    if ((dddValue[0] == '016' ||
            dddValue[0] == '017' ||
            dddValue[0] == '018') &&
        (dddValue[1] == '016' ||
            dddValue[1] == '017' ||
            dddValue[1] == '018')) {
      print('Use outros números');
      Toast.show('Use outros números', context, duration: 5);
      _pricesBloc.priceEntrada.add([0, 0]);
    } else {
      print('continue');
      _verifyTaxes(dddValue);
    }
  }

  _verifyTaxes(dddValue) {
    if (dddValue[0] == '011' && dddValue[1] == '016') {
      _normalTaxes = 1.90;

      _plusTaxes = 1.90 + (1.90 * 0.1);
      print(_plusTaxes);
    }
    if (dddValue[0] == '016' && dddValue[1] == '011') {
      _normalTaxes = 2.90;

      _plusTaxes = 2.90 + (2.90 * 0.1);
      print(_plusTaxes);
    }
    if (dddValue[0] == '011' && dddValue[1] == '017') {
      _normalTaxes = 1.70;

      _plusTaxes = 1.70 + (1.70 * 0.1);
      print(_plusTaxes);
    }
    if (dddValue[0] == '017' && dddValue[1] == '011') {
      _normalTaxes = 2.70;

      _plusTaxes = 1.70 + (2.70 * 0.1);
      print(_plusTaxes);
    }
    if (dddValue[0] == '011' && dddValue[1] == '018') {
      _normalTaxes = 0.90;

      _plusTaxes = 0.90 + (0.90 * 0.1);
      print(_plusTaxes);
    }
    if (dddValue[0] == '018' && dddValue[1] == '011') {
      _normalTaxes = 1.90;

      _plusTaxes = 1.90 + (1.90 * 0.1);
      print(_plusTaxes);
    }

    _verifyPrices();
  }

  _verifyPrices() {
    print('formula');

    semPlano = _minBloc.minValue;

    var valorSem = semPlano.toDouble() * _normalTaxes;

    if (_minBloc.minValue > _plansBloc.planValue) {
      comPlano = _plansBloc.planValue - _minBloc.minValue;
    } else {
      comPlano = 0;
    }

    var valorCom = comPlano.abs().toDouble() * _plusTaxes;

    _pricesBloc.priceEntrada.add([valorCom, valorSem]);
  }

  addInfoDdd({dddFrom, dddFor}) {
    print('fromDdd: $dddFrom');
    print('forDdd: $dddFor');

    _dddBloc.dddEntrada.add([dddFrom, dddFor]);
  }

  addInfoMin(minutes) {
    print('min: $minutes');

    _minBloc.minEntrada.add(minutes);
  }

  addInfoPlan(plan) {
    print('planoInt: $plan');

    _plansBloc.planEntrada.add(plan);
  }
}
