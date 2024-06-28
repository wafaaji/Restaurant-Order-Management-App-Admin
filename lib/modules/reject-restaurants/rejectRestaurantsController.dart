import 'package:admin/model/restaurantsModel.dart';
import 'package:admin/modules/reject-restaurants/displayRejectRestaurantsService.dart';
import 'package:admin/native-services/secureStorage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class RejectRestaurantsController extends GetxController{

  var message;

  //for display reject Restaurants
  late DisplayRejectRestaurantsService serviceDisplay;
  var restaurantsList = <Restaurants>[].obs;
  late List<Restaurants> allRestaurants= [];
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  @override
  void onInit() {
    serviceDisplay = DisplayRejectRestaurantsService();
    super.onInit();
  }

  @override
  void onReady() async{
    var token = await storage.read("token");
    allRestaurants = await serviceDisplay.displayRejectRestaurants(token);
    restaurantsList.value = allRestaurants;
    isLoading.value = false;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchData() async {
    isLoading.value = true;

    var token = await storage.read("token");
    allRestaurants = await serviceDisplay.displayRejectRestaurants(token);
    restaurantsList.value = allRestaurants;
    isLoading.value = false;

    await Future.delayed(Duration(seconds: 2)); // Simulate loading
    isLoading.value = false;
  }



}