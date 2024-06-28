import 'package:admin/model/restaurantsModel.dart';
import 'package:admin/model/setPayModel.dart';
import 'package:admin/modules/restaurants/displayRestaurantsService.dart';
import 'package:admin/modules/restaurants/setPayService.dart';
import 'package:admin/native-services/secureStorage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class RestaurantsController extends GetxController{

  var message;

  //for display Restaurants
  late DisplayRestaurantsService serviceDisplay;
  var restaurantsList = <Restaurants>[].obs;
  late List<Restaurants> allRestaurants= [];
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  // for set pay restaurant
  late SetPayService setPayService;
  var setPayStatus;

  @override
  void onInit() {
    serviceDisplay = DisplayRestaurantsService();
    setPayService = SetPayService();
    setPayStatus = false;
    super.onInit();
  }

  @override
  void onReady() async{
    var token = await storage.read("token");
    allRestaurants = await serviceDisplay.displayRestaurants(token);
    restaurantsList.value = allRestaurants;
    isLoading.value = false;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> setPayOnClick(Restaurants restaurants) async{
    SetPay setPay = SetPay(
      id: restaurants.id,
    );
    setPayStatus = await setPayService.setPay(setPay);
    message = setPayService.message;

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
    allRestaurants = await serviceDisplay.displayRestaurants(token);
    restaurantsList.value = allRestaurants;

    isLoading.value = false;
  }

  Future<void> fetchData() async {
    isLoading.value = true;

    var token = await storage.read("token");
    allRestaurants = await serviceDisplay.displayRestaurants(token);
    restaurantsList.value = allRestaurants;
    isLoading.value = false;

    await Future.delayed(Duration(seconds: 2)); // Simulate loading
    isLoading.value = false;
  }


}