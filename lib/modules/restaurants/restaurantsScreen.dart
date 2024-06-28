import 'package:admin/components/customGridRestaurantItem.dart';
import 'package:admin/model/restaurantsModel.dart';
import 'package:admin/modules/restaurants/restaurantsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class restaurantsScreen extends GetView<RestaurantsController> {

  @override
  Widget build(BuildContext context) {
    print(controller.restaurantsList);
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Color(0xFFBE0B0B),));
        }
        return RefreshIndicator(
            onRefresh: controller.fetchData,
            color: Color(0xFFBE0B0B),
            child:Theme(
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
                    child: CustomGridRestaurantItem(
                      imagePath: restaurants.image,
                      text: restaurants.name,
                      payOnPressed: (){
                        onClickSetPay(restaurants);
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

  void onClickSetPay(Restaurants restaurants) async{
    EasyLoading.show(status: "loading...");

    await controller.setPayOnClick(restaurants);

    if(controller.setPayStatus){
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
