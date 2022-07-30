import 'package:easy_localization/easy_localization.dart';

extension ToDate on String {
  String parseLocalDate() {
    var format = DateFormat('d MMMM y - H:m', 'vi');
    var dateString = format.format(DateTime.parse(this).toLocal());
    return dateString;
  }
}
