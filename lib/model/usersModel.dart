class Users {
  int? id;
  String name;
  String email;
  int phone;
  String? emailVerifiedAt;
  String location;
  dynamic createdAt;
  dynamic updatedAt;

  Users({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.emailVerifiedAt,
    required this.location,
    this.createdAt,
    this.updatedAt,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    emailVerifiedAt: json["email_verified_at"],
    location: json["location"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "email_verified_at": emailVerifiedAt,
    "location": location,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}