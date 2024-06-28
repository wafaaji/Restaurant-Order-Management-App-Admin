import 'dart:convert';
import 'package:admin/model/usersModel.dart';

UnblockUsers unblockUsersFromJson(String str) => UnblockUsers.fromJson(json.decode(str));

String unblockUsersToJson(UnblockUsers data) => json.encode(data.toJson());

class UnblockUsers {
  int? id;
  String? message;
  Users? data;

  UnblockUsers({
    this.id,
    this.message,
    this.data,
  });

  factory UnblockUsers.fromJson(Map<String, dynamic> json) => UnblockUsers(
    message: json["message"],
    data: Users.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": id,
  };
}
