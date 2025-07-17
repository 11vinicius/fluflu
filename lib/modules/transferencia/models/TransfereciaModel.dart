class TransfereciaModel {
  final String? id;
  final double valor;
  final int numeroConta;

  TransfereciaModel(this.id, this.valor, this.numeroConta);

  factory TransfereciaModel.fromMap(Map<String, dynamic> map) {
    return TransfereciaModel(
      map['UUID']?.toString(),
      _toDouble(map['valor']),
      _toInt(map['Number']),
    );
  }

  Map<String, dynamic> toMap() => {
    'UUID': id,
    'valor': valor,
    'Number': numeroConta,
  };

  static double _toDouble(dynamic v) {
    if (v is num) return v.toDouble();
    if (v is String) return double.tryParse(v) ?? 0.0;
    return 0.0;
  }

  static int _toInt(dynamic v) {
    if (v is int) return v;
    if (v is double) return v.toInt();
    if (v is String) return int.tryParse(v) ?? 0;
    return 0;
  }
}
