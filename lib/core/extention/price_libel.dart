


import 'package:intl/intl.dart';

extension PriceLibel on int {
  String get withPriceLibel {
    return this > 0 ? separatByComma : 'رایگان';
  }

  String get separatByComma {
    final formatter = NumberFormat.decimalPattern('fa');

    final result = formatter.format(this);
    return result;
  }
}
