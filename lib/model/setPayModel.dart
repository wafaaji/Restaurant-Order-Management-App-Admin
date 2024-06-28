import 'dart:convert';
import 'package:admin/model/payRestaurantModel.dart';

SetPay setPayFromJson(String str) => SetPay.fromJson(json.decode(str));

String setPayToJson(SetPay data) => json.encode(data.toJson());

class SetPay {
  int? id;
  String? message;
  PayRestaurant? data;

  SetPay({
    this.id,
    this.message,
    this.data,
  });

  factory SetPay.fromJson(Map<String, dynamic> json) => SetPay(
    message: json["message"],
    data: PayRestaurant.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "rustaurant_id": id,
  };
}
