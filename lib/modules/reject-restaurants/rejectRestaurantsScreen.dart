import 'package:admin/components/customGridRejectRestaurantItem.dart';
import 'package:admin/modules/reject-restaurants/rejectRestaurantsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class rejectRestaurantsScreen extends GetView<RejectRestaurantsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Color(0xFFBE0B0B),));
        }
        return RefreshIndicator(
          onRefresh: controller.fetchData,
          color: Color(0xFFBE0B0B),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFBE0B0B),)
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GridView.builder(
                  itemCount: controller.allRestaurants.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.3,
                    mainAxisExtent: 140,
                  ),
                  itemBuilder: (context, index) {
                    final restaurants = controller.allRestaurants[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/restaurantDetails", arguments: restaurants);
                      },
                      child: CustomGridRejectRestaurantItem(
                        imagePath: restaurants.image,
                        text: restaurants.name,
                      ),
                    );
                  }
              ),
            ),
          ),
        );
      }),
    );
  }
}
