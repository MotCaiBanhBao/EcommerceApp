// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "email_null_error": "Please Enter your email",
  "invalid_email_error": "Please Enter Valid Email",
  "pass_null_error": "Please Enter your password",
  "too_short_pass_error": "Password is too short",
  "match_pass_error": "Passwords don't match",
  "name_null_error": "Please Enter your name",
  "phone_number_null_error": "Please Enter your phone number",
  "address_null_error": "Please Enter your address",
  "splash_text_1": "Welcome to YSHOP,\nLet shop!",
  "splash_text_2": "We help people connect with store\naround VietNam",
  "splash_text_3": "We show the easy way to shop.\nJust stay at home with us",
  "continue_btn_text": "Continue"
};
static const Map<String,dynamic> vi = {
  "email_null_error": "Vui lòng điền email của bạn",
  "invalid_email_error": "Email không được để trống",
  "pass_null_error": "Mật khẩu không được bỏ trống",
  "too_short_pass_error": "Mật khẩu quá ngắn",
  "match_pass_error": "Password không trùng",
  "name_null_error": "Tên không được để trống",
  "phone_number_null_error": "Số điện thoại không được bỏ trống",
  "address_null_error": "Địa chỉ không được bỏ trống",
  "splash_text_1": "Chào mừng đến với YSHOP, \nCùng nhau mua sắm nào!",
  "splash_text_2": "Chúng tôi kết nối hàng triệu người mua sắm\ntrên khắp Việt Nam",
  "splash_text_3": "Thanh toán thuận lợi. \nDễ dàng mua sắm",
  "continue_btn_text": "Bắt đầu"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "vi": vi};
}
