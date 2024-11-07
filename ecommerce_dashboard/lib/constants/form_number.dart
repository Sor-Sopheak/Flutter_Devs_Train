import 'package:intl/intl.dart';

//USE IT LIKE THIS :  formatNumber(total.toString().replaceAll(',', '')),
String formatNumber(String numberString) {
  return NumberFormat.decimalPattern().format(int.parse(numberString));
}

//USE IT LIKE THIS :  formatCompactNumber(total.toString()),
String formatCompactNumber(int number) {
  return NumberFormat.compact().format(number);
}
