import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppHelpers {
  AppHelpers._();

  static String formatDate(DateTime date) {
    return DateFormat('dd.MM.yyyy', ).format(date);
  }
}
