import 'package:apppeneus/core/models/user.dart';
import 'package:apppeneus/core/routes/action_routes.dart';
import 'package:apppeneus/feature/pneus/pages/inspecao_pneu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/detalhe_pneu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user = User(
      nome: "Fulano",
      email: "fulano@teste.com",
      phone: "(11)111111111",
      endereco: "Rua da Conceição 130");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double appStatus = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height - appStatus,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: size.height * 0.15,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black)),
                      child: FlutterLogo(
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.nome),
                        Text(user.email),
                        Text(user.phone),
                        Text(user.endereco),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  height: size.height - (size.height * 0.15 + appStatus),
                  width: size.width,
                  padding: EdgeInsets.only(right: 8, left: 8, top: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: ListView.builder(
                      itemCount: listPneu.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            AppNavigator.goToInspecaoPneus(context,
                                args: InspecaoPneusScreenArgs(
                                    pneu: listPneu[index], user: user));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black87)),
                            child: Row(
                              children: [
                                FlutterLogo(
                                  size: 30,
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Tipo de Pneu: ${listPneu[index].tipoPneu}"),
                                    Text(
                                        "Cor do Pneu: ${listPneu[index].corPneu}"),
                                    Text(
                                        "Preço do Pneu: ${listPneu[index].precoPneu}"),
                                    Text(
                                        "Tamanho do Pneu: ${listPneu[index].tamanhoPneu}"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

List<Pneu> listPneu = [
  Pneu(tipoPneu: "1", corPneu: "Preto", precoPneu: 20.00, tamanhoPneu: "P"),
  Pneu(tipoPneu: "2", corPneu: "Amarelo", precoPneu: 50.00, tamanhoPneu: "M"),
  Pneu(tipoPneu: "3", corPneu: "Azul", precoPneu: 60.00, tamanhoPneu: "G"),
  Pneu(
      tipoPneu: "4", corPneu: "Vermelho", precoPneu: 100.00, tamanhoPneu: "GG"),
];
