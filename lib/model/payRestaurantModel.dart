class PayRestaurant {
  int id;
  bool isPaid;
  int cost;
  int rustaurantId;
  DateTime end;
  DateTime start;
  DateTime createdAt;
  DateTime updatedAt;

  PayRestaurant({
    required this.id,
    required this.isPaid,
    required this.cost,
    required this.rustaurantId,
    required this.end,
    required this.start,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PayRestaurant.fromJson(Map<String, dynamic> json) => PayRestaurant(
    id: json["id"],
    isPaid: json["is_paid"],
    cost: json["cost"],
    rustaurantId: json["rustaurant_id"],
    end: DateTime.parse(json["end"]),
    start: DateTime.parse(json["start"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_paid": isPaid,
    "cost": cost,
    "rustaurant_id": rustaurantId,
    "end": end.toIso8601String(),
    "start": start.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}