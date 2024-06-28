import 'package:admin/model/acceptRestaurantModel.dart';
import 'package:admin/model/rejectRestaurantModel.dart';
import 'package:admin/model/restaurantsModel.dart';
import 'package:admin/modules/waiting-restaurants/acceptRestaurantService.dart';
import 'package:admin/modules/waiting-restaurants/displayWaitingRestaurantsService.dart';
import 'package:admin/modules/waiting-restaurants/rejectRestaurantService.dart';
import 'package:admin/native-services/secureStorage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class WaitingRestaurantsController extends GetxController{

  var message;

  //for display Restaurants
  late DisplayWaitingRestaurantsService serviceDisplay;
  var restaurantsList = <Restaurants>[].obs;
  late List<Restaurants> allRestaurants= [];
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  // for accept restaurant
  late AcceptRestaurantService acceptRestaurantService;
  var acceptRestaurantStatus;

  // for reject restaurant
  late RejectRestaurantService rejectRestaurantService;
  var rejectRestaurantStatus;

  @override
  void onInit() {
    serviceDisplay = DisplayWaitingRestaurantsService();

    acceptRestaurantService = AcceptRestaurantService();
    acceptRestaurantStatus = false;

    rejectRestaurantService = RejectRestaurantService();
    rejectRestaurantStatus = false;
    super.onInit();
  }

  @override
  void onReady() async{
    var token = await storage.read("token");
    allRestaurants = await serviceDisplay.displayWaitingRestaurants(token);
    restaurantsList.value = allRestaurants;
    isLoading.value = false;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> acceptRestaurantOnClick(Restaurants restaurants, int cost) async{
    AcceptRestaurant acceptRestaurant = AcceptRestaurant(
      cost: cost,
      id: restaurants.id,
    );
    acceptRestaurantStatus = await acceptRestaurantService.acceptRestaurant(acceptRestaurant);
    message = acceptRestaurantService.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

  Future<void> rejectRestaurantOnClick(Restaurants restaurants) async{
    RejectRestaurant rejectRestaurant = RejectRestaurant(
      id: restaurants.id,
    );
    rejectRestaurantStatus = await rejectRestaurantService.rejectRestaurant(rejectRestaurant);
    message = rejectRestaurantService.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

  Future<void> updateRestaurantList() async {
    isLoading.value = true;
    restaurantsList.clear();

    // Fetch the new list of Reservation based on the existing categories
    var token = await storage.read("token");
    allRestaurants = await serviceDisplay.displayWaitingRestaurants(token);
    restaurantsList.value = allRestaurants;

    isLoading.value = false;
  }

  Future<void> fetchData() async {
    isLoading.value = true;

    var token = await storage.read("token");
    allRestaurants = await serviceDisplay.displayWaitingRestaurants(token);
    restaurantsList.value = allRestaurants;
    isLoading.value = false;

    await Future.delayed(Duration(seconds: 2)); // Simulate loading
    isLoading.value = false;
  }




}