double parseMoneyBr(String raw) {
  final semSimbolo = raw.replaceAll('R\$', '').trim();
  final semPontos = semSimbolo.replaceAll('.', '');
  final valorFormatado = semPontos.replaceAll(',', '.');
  return double.tryParse(valorFormatado) ?? 0.0;
}
