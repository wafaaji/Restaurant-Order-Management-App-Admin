class Employees {
  int id;
  String name;
  String email;
  int phone;
  dynamic emailVerifiedAt;
  String location;
  DateTime createdAt;
  DateTime updatedAt;

  Employees({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Employees.fromJson(Map<String, dynamic> json) => Employees(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    emailVerifiedAt: json["email_verified_at"],
    location: json["location"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "email_verified_at": emailVerifiedAt,
    "location": location,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}