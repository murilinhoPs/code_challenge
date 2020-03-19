import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class PriceBloc extends BlocBase {
  final _priceController$ = BehaviorSubject<List<double>>();

  List<double> get priceValue => _priceController$.value;

  Stream<List<double>> get priceSaida => _priceController$.stream;
  Sink<List<double>> get priceEntrada => _priceController$.sink;

  @override
  void dispose() {
    _priceController$.close();
    super.dispose();
  }
}
