
class Pneu{
  final String tipoPneu;
  final String corPneu;
  final double precoPneu;
  final String tamanhoPneu;

  const Pneu({
    required this.tipoPneu,
    required this.corPneu,
    required this.precoPneu,
    required this.tamanhoPneu,
  });

  Map<String, dynamic> toMap() {
    return {
      'tipoPneu': this.tipoPneu,
      'corPneu': this.corPneu,
      'precoPneu': this.precoPneu,
      'tamanhoPneu': this.tamanhoPneu,
    };
  }

  factory Pneu.fromMap(Map<String, dynamic> map) {
    return Pneu(
      tipoPneu: map['tipoPneu'] as String,
      corPneu: map['corPneu'] as String,
      precoPneu: map['precoPneu'] as double,
      tamanhoPneu: map['tamanhoPneu'] as String,
    );
  }
}