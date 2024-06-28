import 'dart:convert';
import 'package:admin/model/usersModel.dart';

DisplayUsers displayUsersFromJson(String str) => DisplayUsers.fromJson(json.decode(str));

String displayUsersToJson(DisplayUsers data) => json.encode(data.toJson());

class DisplayUsers {
  String message;
  List<Users> data;

  DisplayUsers({
    required this.message,
    required this.data,
  });

  factory DisplayUsers.fromJson(Map<String, dynamic> json) => DisplayUsers(
    message: json["message"],
    data: List<Users>.from(json["data"].map((x) => Users.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
