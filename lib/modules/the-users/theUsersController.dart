import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TheUsersController extends GetxController with SingleGetTickerProviderMixin{
  late TabController usersController;

  final List<Tab> usersTabs = <Tab>[
    Tab(
      text: "Users",
    ),
    Tab(
      text: "Block Users",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    usersController = TabController(length: usersTabs.length, vsync: this);
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose() {
    usersController.dispose();
    super.onClose();
  }
}
