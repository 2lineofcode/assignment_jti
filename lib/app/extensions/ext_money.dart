extension MoneyFormatExt on num {
  /// example: 1000 -> 'Rp. 1,000'
  String moneyFormat({String? symbol = 'Rp. '}) {
    String formattedText = '$symbol${toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
    return formattedText;
  }

  /// example: 1000 -> '1K'
  /// example: 1000000 -> '1M'
  String moneyFormatCompact() {
    if (this < 1000) {
      return toString();
    } else if (this < 1000000) {
      return '${(this / 1000).toStringAsFixed(0)}K';
    } else if (this < 1000000000) {
      return '${(this / 1000000).toStringAsFixed(0)}M';
    } else if (this < 1000000000000) {
      return '${(this / 1000000000).toStringAsFixed(0)}B';
    } else {
      return '${(this / 1000000000000).toStringAsFixed(0)}T';
    }
  }

  /// example: 100 -> '100%'
  String percentageFormat({String? symbol = '%'}) {
    String formattedText = '${(this * 100).toStringAsFixed(2).replaceAll('.00', '')}$symbol';
    return formattedText;
  }
}

extension MoneyUnformatExt on String {
  /// example: 'Rp. 1.000' -> 1000
  int? moneyUnformat() => double.tryParse(replaceAll(RegExp(r'[^0-9]'), ''))?.floor();
}
