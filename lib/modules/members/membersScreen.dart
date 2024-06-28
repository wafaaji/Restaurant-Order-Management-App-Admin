import 'package:admin/modules/employees/employeesScreen.dart';
import 'package:admin/modules/managers/managersScreen.dart';
import 'package:admin/modules/members/membersController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class membersScreen extends GetView<MembersController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBE0B0B),
        title:  Text(
          "The Members",
          style: GoogleFonts.lato(
            fontSize: 30,
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
                managersScreen(),
                employeesScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
