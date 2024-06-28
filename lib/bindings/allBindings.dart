import 'package:admin/modules/block-users/blockUsersController.dart';
import 'package:admin/modules/employees/employeesController.dart';
import 'package:admin/modules/login/loginController.dart';
import 'package:admin/modules/managers/managersController.dart';
import 'package:admin/modules/members/membersController.dart';
import 'package:admin/modules/reject-restaurants/rejectRestaurantsController.dart';
import 'package:admin/modules/restaurant-details/restaurantDetailsController.dart';
import 'package:admin/modules/restaurants/restaurantsController.dart';
import 'package:admin/modules/splash/splashController.dart';
import 'package:admin/modules/the-restaurants/theRestaurantController.dart';
import 'package:admin/modules/the-users/theUsersController.dart';
import 'package:admin/modules/users/usersController.dart';
import 'package:admin/modules/waiting-restaurants/waitingRestaurantsController.dart';
import 'package:get/get.dart';

class allBindings extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => TheRestaurantsController());
    Get.lazyPut(() => RestaurantsController());
    Get.lazyPut(() => WaitingRestaurantsController());
    Get.lazyPut(() => RejectRestaurantsController());
    Get.lazyPut(() => RestaurantDetailsController());
    Get.lazyPut(() => MembersController());
    Get.lazyPut(() => ManagersController());
    Get.lazyPut(() => EmployeesController());
    Get.lazyPut(() => TheUsersController());
    Get.lazyPut(() => UsersController());
    Get.lazyPut(() => BlockUsersController());

  }
}