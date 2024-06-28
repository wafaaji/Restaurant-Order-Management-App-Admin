import 'dart:convert';
import 'package:admin/config/serverConfig.dart';
import 'package:admin/model/displayUsersModel.dart';
import 'package:admin/model/usersModel.dart';
import 'package:http/http.dart' as http;

class DisplayUsersService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.displayUsers);

  Future<List<Users>> displayUsers(var token) async{
    try {
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${token}",
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        //take json and make it var
        var users = displayUsersFromJson(response.body);
        var jsonResponse = jsonDecode(response.body);
        var usersList = jsonResponse["data"];
        print("-----------------display Users----------------");
        print(usersList);

        List<Users> userList = List<Users>.from(usersList.map((item) => Users.fromJson(item)));

        return userList;
      } else {
        message = 'Server Error';
        return [];
      }
    } catch (e) {
      print("Exception during logout request: $e");
      message = 'An error occurred';
      return [];
    }

  }


}