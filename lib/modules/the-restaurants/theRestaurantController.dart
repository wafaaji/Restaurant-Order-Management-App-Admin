import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TheRestaurantsController extends GetxController with SingleGetTickerProviderMixin{
  late TabController restaurantsController;

  final List<Tab> restaurantsTabs = <Tab>[
    Tab(
      text: "Restaurants",
    ),
    Tab(
      text: "Waiting Restaurants",
    ),
    Tab(
      text: "Reject Restaurants",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    restaurantsController = TabController(length: restaurantsTabs.length, vsync: this);
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose() {
    restaurantsController.dispose();
    super.onClose();
  }
}
