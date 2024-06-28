import 'dart:convert';
import 'package:admin/config/serverConfig.dart';
import 'package:admin/model/rejectRestaurantModel.dart';
import 'package:admin/native-services/secureStorage.dart';
import 'package:http/http.dart' as http;

class RejectRestaurantService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.rejectRestaurant);

  Future<bool> rejectRestaurant(RejectRestaurant rejectRestaurant) async{

    SecureStorage storage = SecureStorage();
    var token = await storage.read("token");

    var response = await http.post(
      url,
      headers: {
        "Authorization" : "Bearer $token"
      },
      body: {
        "rustaurant_id" : "${rejectRestaurant.id}",
      },
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message"];
      return true;
    }else if (response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message"];
      return false;
    }else{
      message = 'Server Error';
      return false;
    }

  }

}