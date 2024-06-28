class Managers {
  int id;
  String name;
  String email;
  int phone;
  DateTime emailVerifiedAt;
  String location;
  DateTime createdAt;
  DateTime updatedAt;

  Managers({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Managers.fromJson(Map<String, dynamic> json) => Managers(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    location: json["location"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "location": location,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}