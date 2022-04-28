
class User{
  final String nome;
  final String email;
  final String phone;
  final String endereco;

  const User({
    required this.nome,
    required this.email,
    required this.phone,
    required this.endereco,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': this.nome,
      'email': this.email,
      'phone': this.phone,
      'endereco': this.endereco,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nome: map['nome'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      endereco: map['endereco'] as String,
    );
  }
}