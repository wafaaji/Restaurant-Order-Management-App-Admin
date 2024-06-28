class RestaurantAccept {
  int id;
  String? name;
  String? description;
  String? tableNumber;
  int? managerId;
  int? serviceId;
  String? location;
  int? status;
  String? phone;
  String? image;
  DateTime? createdAt;
  DateTime updatedAt;
  int? rate;
  int? numberUserRate;
  String? cost;
  String? rustaurantId;
  bool? isPaid;
  DateTime? start;
  DateTime? end;

  RestaurantAccept({
    required this.id,
    this.name,
    this.description,
    this.tableNumber,
    this.managerId,
    this.serviceId,
    this.location,
    this.status,
    this.phone,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    this.rate,
    this.numberUserRate,
    this.cost,
    this.rustaurantId,
    this.isPaid,
    this.start,
    this.end,
  });

  factory RestaurantAccept.fromJson(Map<String, dynamic> json) => RestaurantAccept(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    tableNumber: json["table_number"],
    managerId: json["manager_id"],
    serviceId: json["service_id"],
    location: json["location"],
    status: json["status"],
    phone: json["phone"],
    image: json["image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    rate: json["rate"],
    numberUserRate: json["numberUserRate"],
    cost: json["cost"],
    rustaurantId: json["rustaurant_id"],
    isPaid: json["is_paid"],
    start: json["start"] == null ? null : DateTime.parse(json["start"]),
    end: json["end"] == null ? null : DateTime.parse(json["end"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "table_number": tableNumber,
    "manager_id": managerId,
    "service_id": serviceId,
    "location": location,
    "status": status,
    "phone": phone,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "rate": rate,
    "numberUserRate": numberUserRate,
    "cost": cost,
    "rustaurant_id": rustaurantId,
    "is_paid": isPaid,
    "start": start?.toIso8601String(),
    "end": end?.toIso8601String(),
  };
}