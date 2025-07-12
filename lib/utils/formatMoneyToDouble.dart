double parseMoneyBr(String raw) {
  // Remove 'R$' e espaços
  final semSimbolo = raw.replaceAll('R\$', '').trim();

  // Remove pontos de milhar (.)
  final semPontos = semSimbolo.replaceAll('.', '');

  // Troca vírgula decimal por ponto decimal
  final valorFormatado = semPontos.replaceAll(',', '.');

  // Tenta converter
  return double.tryParse(valorFormatado) ?? 0.0;
}
