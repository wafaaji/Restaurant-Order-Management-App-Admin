import 'package:admin/modules/reject-restaurants/rejectRestaurantsScreen.dart';
import 'package:admin/modules/restaurants/restaurantsScreen.dart';
import 'package:admin/modules/the-restaurants/theRestaurantController.dart';
import 'package:admin/modules/waiting-restaurants/waitingRestaurantsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class theRestaurantsScreen extends GetView<TheRestaurantsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBE0B0B),
        title:  Text(
          "The Restaurants",
          style: GoogleFonts.lato(
            fontSize: 25,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        bottom: TabBar(
          //isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 4.0,
          unselectedLabelColor: Colors.black,
          labelStyle: GoogleFonts.lato(
            fontSize: 15,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
          controller: controller.restaurantsController,
          tabs: controller.restaurantsTabs,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.restaurantsController,
              children: [
                restaurantsScreen(),
                waitingRestaurantsScreen(),
                rejectRestaurantsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
