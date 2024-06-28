import 'dart:convert';
import 'package:admin/config/serverConfig.dart';
import 'package:admin/model/displayBlockedUsersModel.dart';
import 'package:admin/model/dataModel.dart';
import 'package:http/http.dart' as http;

class DisplayBlockedUsersService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.displayBlockedUsers);

  Future<List<Data>> displayBlockedUsers(var token) async{
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
        var blockedUsers = displayBlockedUsersFromJson(response.body);
        var jsonResponse = jsonDecode(response.body);
        var blockedUsersList = jsonResponse["data"];
        print("-----------------display block Users----------------");
        print(blockedUsersList);

        List<Data> blockedUserList = List<Data>.from(blockedUsersList.map((item) => Data.fromJson(item)));

        return blockedUserList;
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