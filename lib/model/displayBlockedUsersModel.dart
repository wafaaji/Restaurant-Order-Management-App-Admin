import 'dart:convert';

import 'package:admin/model/dataModel.dart';

DisplayBlockedUsers displayBlockedUsersFromJson(String str) => DisplayBlockedUsers.fromJson(json.decode(str));

String displayBlockedUsersToJson(DisplayBlockedUsers data) => json.encode(data.toJson());

class DisplayBlockedUsers {
  String message;
  List<Data> data;

  DisplayBlockedUsers({
    required this.message,
    required this.data,
  });

  factory DisplayBlockedUsers.fromJson(Map<String, dynamic> json) => DisplayBlockedUsers(
    message: json["message"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
