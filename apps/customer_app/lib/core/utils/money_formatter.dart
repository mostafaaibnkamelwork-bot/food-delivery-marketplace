import 'package:intl/intl.dart';

class MoneyFormatter {
  static String format(num amount, {String currency = 'SAR'}) {
    return NumberFormat.currency(symbol: currency).format(amount);
  }
}
