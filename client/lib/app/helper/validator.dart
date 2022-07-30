import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../translations/locale_keys.g.dart';

String? emailValidator(String? string) {
  final emailRegExp =
      RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  if (string == null || string.isEmpty) {
    return LocaleKeys.email_null_error.tr();
  } else if (emailRegExp.hasMatch(string)) {
    return null;
  }

  return LocaleKeys.invalid_email_error.tr();
}

String? passwordValidator(String? string) {
  if (string == null || string.isEmpty) {
    return LocaleKeys.pass_null_error.tr();
  } else if (string.runes.length >= 6) {
    return null;
  }
  return LocaleKeys.too_short_pass_error.tr();
}
