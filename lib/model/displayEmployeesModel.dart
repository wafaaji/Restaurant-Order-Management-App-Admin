import 'dart:convert';
import 'package:admin/model/EmployeesModel.dart';

DisplayEmployees displayEmployeesFromJson(String str) => DisplayEmployees.fromJson(json.decode(str));

String displayEmployeesToJson(DisplayEmployees data) => json.encode(data.toJson());

class DisplayEmployees {
  String message;
  List<Employees> data;

  DisplayEmployees({
    required this.message,
    required this.data,
  });

  factory DisplayEmployees.fromJson(Map<String, dynamic> json) =>
      DisplayEmployees(
        message: json["message"],
        data: List<Employees>.from(json["data"].map((x) => Employees.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

