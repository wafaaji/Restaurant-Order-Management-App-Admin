import 'package:admin/model/usersModel.dart';

class Data {
  int id;
  Users users;
  Users user;

  Data({
    required this.id,
    required this.users,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    users: Users.fromJson(json["users"]),
    user: Users.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "users": users.toJson(),
    "user": user.toJson(),
  };
}