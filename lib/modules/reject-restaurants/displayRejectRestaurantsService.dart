import 'dart:convert';
import 'package:admin/config/serverConfig.dart';
import 'package:admin/model/displayRestaurantsModel.dart';
import 'package:admin/model/restaurantsModel.dart';
import 'package:http/http.dart' as http;

class DisplayRejectRestaurantsService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.displayRejectRestaurants);

  Future<List<Restaurants>> displayRejectRestaurants(var token) async{
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
        var restaurants = displayRestaurantsFromJson(response.body);
        var jsonResponse = jsonDecode(response.body);
        var restaurantsList = jsonResponse["data"];
        print("-----------------display reject restaurants----------------");
        print(restaurantsList);

        List<Restaurants> restaurantList = List<Restaurants>.from(restaurantsList.map((item) => Restaurants.fromJson(item)));

        return restaurantList;
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