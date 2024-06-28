class RestaurantReject {
  int id;
  String name;
  String description;
  String tableNumber;
  int managerId;
  int serviceId;
  String location;
  int status;
  String phone;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int rate;
  int numberUserRate;

  RestaurantReject({
    required this.id,
    required this.name,
    required this.description,
    required this.tableNumber,
    required this.managerId,
    required this.serviceId,
    required this.location,
    required this.status,
    required this.phone,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.rate,
    required this.numberUserRate,
  });

  factory RestaurantReject.fromJson(Map<String, dynamic> json) => RestaurantReject(
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
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    rate: json["rate"],
    numberUserRate: json["numberUserRate"],
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "rate": rate,
    "numberUserRate": numberUserRate,
  };
}