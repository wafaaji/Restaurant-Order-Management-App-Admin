import 'dart:convert';
import 'package:admin/config/serverConfig.dart';
import 'package:admin/model/setPayModel.dart';
import 'package:admin/native-services/secureStorage.dart';
import 'package:http/http.dart' as http;

class SetPayService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.setPay);

  Future<bool> setPay(SetPay setPay) async{

    SecureStorage storage = SecureStorage();
    var token = await storage.read("token");

    var response = await http.post(
      url,
      headers: {
        "Authorization" : "Bearer $token"
      },
      body: {
        "rustaurant_id" : "${setPay.id}",
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