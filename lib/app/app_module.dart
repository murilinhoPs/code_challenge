import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tech_challenge/app/app_widget.dart';
import 'package:tech_challenge/app/shared/global/ddd_bloc.dart';
import 'package:tech_challenge/app/shared/global/minutes_bloc.dart';
import 'package:tech_challenge/app/shared/global/planos_bloc.dart';
import 'package:tech_challenge/app/shared/global/price_bloc.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((_) => DddBloc()),
        Bloc((_) => MinutesBloc()),
        Bloc((_) => PlansBloc()),
        Bloc((_) => PriceBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
