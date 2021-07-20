import 'package:intl/intl.dart';

String numberFormat(number, {String symbol = "Gs."}) {
  var formatter = NumberFormat.currency(
      customPattern: '#,##0',
      decimalDigits: 0,
      symbol: symbol,
      locale: 'es_ES');
  return "$symbol " + formatter.format(number);
}
