import 'dart:convert';
import 'package:admin/model/managersModel.dart';

DisplayManagers displayManagersFromJson(String str) => DisplayManagers.fromJson(json.decode(str));

String displayManagersToJson(DisplayManagers data) => json.encode(data.toJson());

class DisplayManagers {
  String message;
  List<Managers> data;

  DisplayManagers({
    required this.message,
    required this.data,
  });

  factory DisplayManagers.fromJson(Map<String, dynamic> json) => DisplayManagers(
    message: json["message"],
    data: List<Managers>.from(json["data"].map((x) => Managers.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
