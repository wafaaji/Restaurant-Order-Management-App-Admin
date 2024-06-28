import 'dart:convert';
import 'package:admin/model/restaurantAcceptModel.dart';

AcceptRestaurant acceptRestaurantFromJson(String str) => AcceptRestaurant.fromJson(json.decode(str));

String acceptRestaurantToJson(AcceptRestaurant data) => json.encode(data.toJson());

class AcceptRestaurant {
  int? id;
  int? cost;
  String? message;
  List<RestaurantAccept>? data;

  AcceptRestaurant({
    this.id,
    this.cost,
    this.message,
    this.data,
  });

  factory AcceptRestaurant.fromJson(Map<String, dynamic> json) => AcceptRestaurant(
    message: json["message"],
    data: List<RestaurantAccept>.from(json["data"].map((x) => RestaurantAccept.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cost": cost,
    "rustaurant_id": id,
  };
}
