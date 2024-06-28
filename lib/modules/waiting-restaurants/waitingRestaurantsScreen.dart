import 'package:admin/components/customGridWaitingRestaurantItem.dart';
import 'package:admin/model/restaurantsModel.dart';
import 'package:admin/modules/waiting-restaurants/waitingRestaurantsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class waitingRestaurantsScreen extends GetView<WaitingRestaurantsController> {

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
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.4,
                    mainAxisExtent: 140,
                  ),
                  itemBuilder: (context, index) {
                    final restaurants = controller.allRestaurants[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/restaurantDetails", arguments: restaurants);
                      },
                      child: CustomGridWaitingRestaurantItem(
                        imagePath: restaurants.image,
                        text: restaurants.name,
                        acceptOnPressed: (){
                          onClickAcceptRestaurant(restaurants);
                        },
                        rejectOnPressed: (){
                          onClickRejectRestaurant(restaurants);
                        },
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

  void onClickAcceptRestaurant(Restaurants restaurants) async{
    EasyLoading.show(status: "loading...");

    await controller.acceptRestaurantOnClick(restaurants, 2500);

    if(controller.acceptRestaurantStatus){
      EasyLoading.showSuccess(
        controller.message,
        duration: Duration(seconds: 2),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      Get.toNamed("/home");
      await controller.updateRestaurantList();
    }else{
      EasyLoading.showError(
        controller.message,
        duration: Duration(seconds: 2),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      print("Error Here");
    }
  }

  void onClickRejectRestaurant(Restaurants restaurants) async{
    EasyLoading.show(status: "loading...");

    await controller.rejectRestaurantOnClick(restaurants);

    if(controller.rejectRestaurantStatus){
      EasyLoading.showSuccess(
        controller.message,
        duration: Duration(seconds: 2),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      Get.toNamed("/home");
      await controller.updateRestaurantList();
    }else{
      EasyLoading.showError(
        controller.message,
        duration: Duration(seconds: 2),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      print("Error Here");
    }
  }

}
