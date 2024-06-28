import 'package:admin/modules/block-users/blockUsersScreen.dart';
import 'package:admin/modules/employees/employeesScreen.dart';
import 'package:admin/modules/home/homeScreen.dart';
import 'package:admin/modules/login/loginScreen.dart';
import 'package:admin/modules/managers/managersScreen.dart';
import 'package:admin/modules/members/membersScreen.dart';
import 'package:admin/modules/reject-restaurants/rejectRestaurantsScreen.dart';
import 'package:admin/modules/restaurant-details/restaurantDetailsScreen.dart';
import 'package:admin/modules/restaurants/restaurantsScreen.dart';
import 'package:admin/modules/splash/splashScreen.dart';
import 'package:admin/modules/the-restaurants/theRestaurantsScreen.dart';
import 'package:admin/modules/the-users/theUsersScreen.dart';
import 'package:admin/modules/users/usersScreen.dart';
import 'package:admin/modules/waiting-restaurants/waitingRestaurantsScreen.dart';
import 'package:get/get.dart';

List<GetPage> appPages = [

  GetPage(name: '/login', page: () => loginScreen()),
  GetPage(name: '/home', page: () => homeScreen()),
  GetPage(name: '/splash', page: () => splashScreen()),
  GetPage(name: '/theRestaurants', page: () => theRestaurantsScreen()),
  GetPage(name: '/restaurants', page: () => restaurantsScreen()),
  GetPage(name: '/waitingRestaurants', page: () => waitingRestaurantsScreen()),
  GetPage(name: '/rejectRestaurants', page: () => rejectRestaurantsScreen()),
  GetPage(name: '/restaurantDetails', page: () => restaurantDetailsScreen()),
  GetPage(name: '/members', page: () => membersScreen()),
  GetPage(name: '/managers', page: () => managersScreen()),
  GetPage(name: '/employees', page: () => employeesScreen()),
  GetPage(name: '/theUsers', page: () => theUsersScreen()),
  GetPage(name: '/users', page: () => usersScreen()),
  GetPage(name: '/blockUsers', page: () => blockUsersScreen()),

];
