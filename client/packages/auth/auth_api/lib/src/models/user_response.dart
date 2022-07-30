import 'dart:convert';

import 'package:auth_api/auth_api.dart';

class UserResponse {
  bool? success;
  String? message;
  Data? data;

  UserResponse({this.message, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    success = true;
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  UserResponse.withError({
    int? statusCode,
    bool success = false,
    String? msg,
  })  : success = success,
        message = msg;
}

class Data {
  String? token;
  UserModel? user;
  

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
