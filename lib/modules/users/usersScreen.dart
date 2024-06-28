import 'package:admin/components/customElevatedButton.dart';
import 'package:admin/components/customText.dart';
import 'package:admin/model/usersModel.dart';
import 'package:admin/modules/users/usersController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class usersScreen extends GetView<UsersController> {

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
            child: Padding(
              padding: EdgeInsets.only(top: 10.0,left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFBE0B0B),)
                      ),
                      child: ListView.builder(
                          itemCount: controller.allUsers.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i){
                            final users = controller.allUsers[i];
                            return GestureDetector(
                              onTap: () {
                                //Get.toNamed("/orderDetails", arguments: order);
                              },
                              child: Card(
                                margin: EdgeInsets.only(bottom: 20.0),
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  //height: 10.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  padding: EdgeInsets.only(top: 5.0, left: 10.0, bottom: 5.0, right: 20.0),
                                  child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: users.name,
                                            fontSize: 20.0,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          CustomText(
                                            text: users.phone.toString(),
                                            fontSize: 20.0,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          CustomText(
                                            text: users.email,
                                            fontSize: 20.0,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          CustomText(
                                            text: users.location,
                                            fontSize: 20.0,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          CustomElevatedButton(
                                            onPressed: (){
                                              onClickBlockUser(users);
                                            },
                                            buttonText: "Block User",
                                            height: 30.0,
                                            buttonColor: Color(0xFFBE0B0B),
                                            borderRadius: BorderRadius.circular(20),
                                            textColor: Colors.white,
                                            fontSize: 15.0,
                                          ),
                                        ],
                                      ),
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                ],
              ),
            ),
        );
      }),
    );
  }


  void onClickBlockUser(Users users) async{
    EasyLoading.show(status: "loading...");

    await controller.blockUserOnClick(users);

    if(controller.blockUserStatus){
      EasyLoading.showSuccess(
        controller.message,
        duration: Duration(seconds: 2),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      Get.toNamed("/home");
      await controller.updateUserList();
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
