import 'dart:convert';
import 'package:admin/model/restaurantsModel.dart';

DisplayRestaurants displayRestaurantsFromJson(String str) => DisplayRestaurants.fromJson(json.decode(str));

String displayRestaurantsToJson(DisplayRestaurants data) => json.encode(data.toJson());

class DisplayRestaurants {
  String message;
  List<Restaurants> data;

  DisplayRestaurants({
    required this.message,
    required this.data,
  });

  factory DisplayRestaurants.fromJson(Map<String, dynamic> json) => DisplayRestaurants(
    message: json["message"],
    data: List<Restaurants>.from(json["data"].map((x) => Restaurants.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
