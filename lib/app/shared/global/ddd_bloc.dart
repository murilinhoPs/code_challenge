import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class DddBloc extends BlocBase {
  final _dddController$ = BehaviorSubject<List<String>>();
  List<String> get dddValue => _dddController$.value;

  Stream<List<String>> get dddSaida => _dddController$.stream;
  Sink<List<String>> get dddEntrada => _dddController$.sink;

  verifyDdd(String value, List<String> arrayDdd) {
    if (value == '011') {
      arrayDdd.remove('011');
    }
    if (value == '016') {
      arrayDdd.remove('016');
    }
    if (value == '017') {
      arrayDdd.remove('017');
    }
    if (value == '018') {
      arrayDdd.remove('018');
    }
    if (value != '011' && !arrayDdd.contains('011')) {
      arrayDdd.insert(0, '011');
    }
    // DIFERENTE
    if (value != '016' && !arrayDdd.contains('016')) {
      if (arrayDdd.contains('011') && arrayDdd.length > 3) {
        arrayDdd.insert(1, '016');
      } else {
        arrayDdd.insert(0, '016');
      }
    }
    if (value != '017' && !arrayDdd.contains('017')) {
      if (arrayDdd.contains('016') && arrayDdd.length > 3) {
        arrayDdd.insert(2, '017');
      } else {
        arrayDdd.insert(1, '017');
      }
    }
    if (value != '018' && !arrayDdd.contains('018')) {
      arrayDdd.add('018');
    }
  }

  @override
  void dispose() {
    _dddController$.close();
    super.dispose();
  }
}
