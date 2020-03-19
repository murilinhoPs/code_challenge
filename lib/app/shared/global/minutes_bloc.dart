import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class MinutesBloc extends BlocBase {
  final _minController$ = BehaviorSubject<int>();

  int get minValue => _minController$.value;
  Stream<int> get minSaida => _minController$.stream;
  Sink<int> get minEntrada => _minController$.sink;

  @override
  void dispose() {
    _minController$.close();
    super.dispose();
  }
}
