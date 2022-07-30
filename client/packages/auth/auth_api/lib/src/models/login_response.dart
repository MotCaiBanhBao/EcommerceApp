import 'dart:convert';

class LoginResponse {
  LoginResponse({
    this.success = true,
    this.message,
    this.data,
  });

  bool success = true;
  String? message;
  String? data;

  bool get isSuccess => success;

  LoginResponse.withError({
    int? statusCode,
    bool success = false,
    String? msg,
  })  : success = success,
        message = msg;

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        data: json["data"],
      );
}
