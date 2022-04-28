import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/detalhe_pneu.dart';
import '../../../core/models/user.dart';
import '../../../core/routes/action_routes.dart';

class InspecaodetalheScreenArgs {
  final Pneu pneu;
  final User user;

  const InspecaodetalheScreenArgs({
    required this.pneu,
    required this.user,
  });
}

class InspecaodetalheScreen extends StatefulWidget {
  const InspecaodetalheScreen({Key? key, required this.args}) : super(key: key);

  final InspecaodetalheScreenArgs args;

  @override
  State<InspecaodetalheScreen> createState() => _InspecaodetalheScreenState();
}

class _InspecaodetalheScreenState extends State<InspecaodetalheScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double appStatus = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Pneu"),
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
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: FlutterLogo(
                size: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Tipo de Pneu: ${widget.args.pneu.tipoPneu}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Cor do Pneu: ${widget.args.pneu.corPneu}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Tamanho do Pneu: ${widget.args.pneu.tamanhoPneu}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Preço do Pneu: ${widget.args.pneu.precoPneu}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
