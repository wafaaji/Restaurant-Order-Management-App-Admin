import 'dart:convert';
import 'package:admin/model/restaurantRejectModel.dart';

RejectRestaurant rejectRestaurantFromJson(String str) => RejectRestaurant.fromJson(json.decode(str));

String rejectRestaurantToJson(RejectRestaurant data) => json.encode(data.toJson());

class RejectRestaurant {
  int? id;
  String? message;
  RestaurantReject? data;

  RejectRestaurant({
    this.id,
    this.message,
    this.data,
  });

  factory RejectRestaurant.fromJson(Map<String, dynamic> json) => RejectRestaurant(
    message: json["message"],
    data: RestaurantReject.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "rustaurant_id": id,
  };
}
