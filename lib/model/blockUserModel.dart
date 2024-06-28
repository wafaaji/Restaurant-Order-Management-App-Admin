import 'dart:convert';
import 'package:admin/model/usersModel.dart';

BlockUsers blockUsersFromJson(String str) => BlockUsers.fromJson(json.decode(str));

String blockUsersToJson(BlockUsers data) => json.encode(data.toJson());

class BlockUsers {
  int? id;
  String? message;
  Users? data;

  BlockUsers({
    this.id,
    this.message,
    this.data,
  });

  factory BlockUsers.fromJson(Map<String, dynamic> json) => BlockUsers(
    message: json["message"],
    data: Users.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": id,
  };
}
