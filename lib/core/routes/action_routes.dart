import 'package:apppeneus/feature/pneus/pages/inspecao_detalhe.dart';
import 'package:apppeneus/feature/pneus/pages/inspecao_pneu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/strings.dart';
import 'routes.dart';

abstract class AppNavigator {
  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.login);
  }

  static void goToHome(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool(AUTH) ?? false) {
      Navigator.pushNamed(context, AppRoutes.home);
    } else {
      Navigator.pushNamed(context, AppRoutes.login);
    }
  }

  static void goToInspecaoPneus(BuildContext context,
      {required InspecaoPneusScreenArgs args}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool(AUTH) ?? false) {
      Navigator.pushNamed(context, AppRoutes.inspecao_pneu, arguments: args);
    } else {
      Navigator.pushNamed(context, AppRoutes.login);
    }
  }

  static void goToInspecaoDetalhes(BuildContext context,
      {required InspecaodetalheScreenArgs args}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool(AUTH) ?? false) {
      Navigator.pushNamed(context, AppRoutes.inspecao_detalhe, arguments: args);
    } else {
      Navigator.pushNamed(context, AppRoutes.login);
    }
  }
}
