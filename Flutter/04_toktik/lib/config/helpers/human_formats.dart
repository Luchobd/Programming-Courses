import 'package:intl/intl.dart';

// * humanReadableNumber -> Formatea un número para que sea más fácil de leer. Ej: 1000 -> 1k, 1000000 -> 1M.
class HumanFormats {
  static String humanReadableNumber(double number) {

    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '', 
    ).format(number);

    return formatterNumber;
  }
}
