import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class PlansBloc extends BlocBase {
  final _planController$ = BehaviorSubject<int>();

  int get planValue => _planController$.value;
  Stream<int> get planSaida => _planController$.stream;
  Sink<int> get planEntrada => _planController$.sink;

  @override
  void dispose() {
    _planController$.close();
    super.dispose();
  }
}
