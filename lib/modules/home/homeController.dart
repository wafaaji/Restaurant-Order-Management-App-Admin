import 'package:admin/modules/members/membersScreen.dart';
import 'package:admin/modules/the-restaurants/theRestaurantsScreen.dart';
import 'package:admin/modules/the-users/theUsersScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  List<Widget>pages =[
    theRestaurantsScreen(),
    membersScreen(),
    theUsersScreen(),
  ];

  var tabIndex = 0;

  void changeTabIndex (index) {
    print("Changing tab index to: $index");
    tabIndex = index ;
    update();
  }

}