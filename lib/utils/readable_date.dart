import 'package:intl/intl.dart';

String getReadableDate(DateTime? date) {
  if (date == null) {
    return '';
  }
  return DateFormat('d MMMM yyyy', 'ru').format(date);
}
