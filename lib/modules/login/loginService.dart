import 'dart:convert';
import 'package:admin/config/serverConfig.dart';
import 'package:admin/model/loginModel.dart';
import 'package:admin/native-services/secureStorage.dart';
import 'package:http/http.dart' as http;

class LoginService {

  var message;
  var token;

  var url = Uri.parse(ServerConfig.login);

  Future<bool> login(Login login) async{
    print("Email: ${login.email}");
    print("Password: ${login.password}");
    var response = await http.post(
      url,
      headers: {},
      body: {
        "email" : login.email,
        "password" : login.password,
      },
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      //take json and make it var
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message"];
      token = jsonResponse["token"];
      SecureStorage storage = SecureStorage();
      await storage.save("token", token);
      return true;
    }else if (response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["email"];
      return false;
    }else if (response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse["message"];
      return false;
    }else{
      message = 'Server Error';
      return false;
    }

  }

}