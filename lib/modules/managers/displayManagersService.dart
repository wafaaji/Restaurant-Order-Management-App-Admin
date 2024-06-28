import 'dart:convert';
import 'package:admin/config/serverConfig.dart';
import 'package:admin/model/displayManagersModel.dart';
import 'package:admin/model/managersModel.dart';
import 'package:http/http.dart' as http;

class DisplayManagersService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.displayManagers);

  Future<List<Managers>> displayManagers(var token) async{
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
        var managers = displayManagersFromJson(response.body);
        var jsonResponse = jsonDecode(response.body);
        var managersList = jsonResponse["data"];
        print("-----------------display managers----------------");
        print(managersList);

        List<Managers> managerList = List<Managers>.from(managersList.map((item) => Managers.fromJson(item)));

        return managerList;
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