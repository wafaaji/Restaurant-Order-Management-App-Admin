class Restaurants {
  int id;
  String name;
  String description;
  String tableNumber;
  int managerId;
  String location;
  int status;
  int startTime;
  int endTime;
  String phone;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int rate;
  int numberUserRate;
  int order;
  int reservation;

  Restaurants({
    required this.id,
    required this.name,
    required this.description,
    required this.tableNumber,
    required this.managerId,
    required this.location,
    required this.status,
    required this.startTime,
    required this.endTime,
    required this.phone,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.rate,
    required this.numberUserRate,
    required this.order,
    required this.reservation,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    tableNumber: json["table_number"],
    managerId: json["manager_id"],
    location: json["location"],
    status: json["status"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    phone: json["phone"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    rate: json["rate"],
    numberUserRate: json["numberUserRate"],
    order: json["order"],
    reservation: json["reservation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "table_number": tableNumber,
    "manager_id": managerId,
    "location": location,
    "status": status,
    "start_time": startTime,
    "end_time": endTime,
    "phone": phone,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "rate": rate,
    "numberUserRate": numberUserRate,
    "order": order,
    "reservation": reservation,
  };
}