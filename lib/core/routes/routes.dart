import 'package:flutter/material.dart';

import '../../feature/auth/page/login.dart';
import '../../feature/home/pages/home.dart';
import '../../feature/pneus/pages/inspecao_detalhe.dart';
import '../../feature/pneus/pages/inspecao_pneu.dart';

abstract class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const inspecao_pneu = '/inspecao_pneu';
  static const inspecao_detalhe = '/inspecao_detalhe';

  static Route<dynamic> routes(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case login:
        screen = Login();
        break;
      case home:
        screen = HomeScreen();
        break;
      case inspecao_pneu:
        screen = InspecaoPneusScreen(
          args: settings.arguments as InspecaoPneusScreenArgs,
        );
        break;
      case inspecao_detalhe:
        screen = InspecaodetalheScreen(
          args: settings.arguments as InspecaodetalheScreenArgs,
        );
        break;
      default:
        screen = Login();
    }
    return MaterialPageRoute(builder: (_) => screen, settings: settings);
  }
}
