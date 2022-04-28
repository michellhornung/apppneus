class Autenticacao {
  String email;
  String senha;

  static const String EMAIL_DB = "fulano@teste.com";
  static const String SENHA_DB = "123456789";

  Autenticacao({
    required this.email,
    required this.senha,
  });

  bool autenticar() {
    return (email == EMAIL_DB && senha == SENHA_DB);
  }
}
