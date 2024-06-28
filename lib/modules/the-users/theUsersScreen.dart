import 'package:admin/modules/block-users/blockUsersScreen.dart';
import 'package:admin/modules/reject-restaurants/rejectRestaurantsScreen.dart';
import 'package:admin/modules/restaurants/restaurantsScreen.dart';
import 'package:admin/modules/the-users/theUsersController.dart';
import 'package:admin/modules/users/usersScreen.dart';
import 'package:admin/modules/waiting-restaurants/waitingRestaurantsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class theUsersScreen extends GetView<TheUsersController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBE0B0B),
        title:  Text(
          "The Users",
          style: GoogleFonts.lato(
            fontSize: 30.0,
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
          controller: controller.usersController,
          tabs: controller.usersTabs,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.usersController,
              children: [
                usersScreen(),
                blockUsersScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
