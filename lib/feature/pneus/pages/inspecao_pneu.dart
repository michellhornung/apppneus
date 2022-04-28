import 'package:apppeneus/core/models/detalhe_pneu.dart';
import 'package:apppeneus/feature/pneus/pages/inspecao_detalhe.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/user.dart';
import '../../../core/routes/action_routes.dart';

class InspecaoPneusScreenArgs {
  final Pneu pneu;
  final User user;

  const InspecaoPneusScreenArgs({
    required this.pneu,
    required this.user,
  });
}

class InspecaoPneusScreen extends StatefulWidget {
  const InspecaoPneusScreen({Key? key, required this.args}) : super(key: key);
  final InspecaoPneusScreenArgs args;

  @override
  State<InspecaoPneusScreen> createState() => _InspecaoPneusScreenState();
}

class _InspecaoPneusScreenState extends State<InspecaoPneusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inspeção do Pneu"),
        actions: [
          PopupMenuButton(
              onSelected: (value) async {
                if (value == 1) {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.clear();
                  AppNavigator.goToLogin(context);
                }
              },
              itemBuilder: (context) =>
                  [PopupMenuItem(value: 1, child: Text("SAIR"))])
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Usuario: ${widget.args.user.nome}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Realizando a inspeção do Pneu",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 100,
                width: 100,
                child: CircularProgressIndicator()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: double.infinity, minHeight: 60),
                child: ElevatedButton(
                    onPressed: () {
                      AppNavigator.goToInspecaoDetalhes(context,
                          args: InspecaodetalheScreenArgs(
                              pneu: widget.args.pneu, user: widget.args.user));
                    },
                    child: Text("VER OS DETALHES DO PNEU")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
