import 'dart:convert';
import 'package:admin/model/adminModel.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String? message;
  Admin? data;
  String? role;
  String? token;
  String? email;
  String? password;

  Login({
    this.message,
    this.data,
    this.role,
    this.token,
    this.email,
    this.password,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    message: json["message"],
    data: Admin.fromJson(json["data"]),
    role: json["Role"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
