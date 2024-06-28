import 'package:admin/modules/home/homeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class homeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return GetBuilder <HomeController>(
        init: HomeController(),
        builder: (controller) =>Scaffold(
        body: Stack(
          children: [
            controller.pages.elementAt(controller.tabIndex),
            Padding(
              padding: EdgeInsets.all (30.0),
              child: Align(
                alignment: Alignment(0.0 , 1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  child: BottomNavigationBar(
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.black,
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    backgroundColor: Color(0xFFBE0B0B),
                    currentIndex: controller.tabIndex,
                    onTap: (index) {
                      controller.changeTabIndex(index);
                    },
                    items: [
                      BottomNavigationBarItem(label: 'restaurants' ,icon: Icon(Icons.restaurant_menu_outlined),),
                      BottomNavigationBarItem(label: 'members',icon: Icon(Icons.manage_accounts_outlined),),
                      BottomNavigationBarItem(label: 'users',icon: Icon(Icons.person_outlined),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        ),
    );
  }
}
