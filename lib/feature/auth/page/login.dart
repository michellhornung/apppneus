import 'dart:math';

import 'package:apppeneus/core/routes/action_routes.dart';
import 'package:apppeneus/core/utils/strings.dart';
import 'package:apppeneus/core/validator/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final Autenticacao _autenticacao = Autenticacao(email: '', senha: '');

  showNaoAutenticado() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login não aprovado"),
            content: Text("Email ou senha não correspondem"),
          );
        });
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double appStatus = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height - appStatus,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, right: 20, left: 20, bottom: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Seu Email",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextField(
                          onChanged: (text) {},
                          controller: _emailController,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, right: 20, left: 20, bottom: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Sua senha",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextField(
                          onChanged: (text) {},
                          controller: _senhaController,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                      minWidth: double.infinity, minHeight: 60),
                  child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        _autenticacao.email = _emailController.text;
                        _autenticacao.senha = _senhaController.text;
                        if (_autenticacao.autenticar()) {
                          pref.setString(TOKEN, getRandomString(10));
                          pref.setBool(AUTH, true);
                          AppNavigator.goToHome(context);
                        } else {
                          showNaoAutenticado();
                        }
                      },
                      child: Text("ENTRAR")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
