import 'dart:ui';
import 'package:admin/components/customElevatedButton.dart';
import 'package:admin/components/customText.dart';
import 'package:admin/components/customTextField.dart';
import 'package:admin/modules/login/loginController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class loginScreen extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: Color(0xFFBE0B0B),
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFBE0B0B),)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.12,
                width: width,
                color: Color(0xFFBE0B0B),
              ),
              Container(
                height: height * 0.88,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25.0,),topLeft: Radius.circular(25.0,)),
                  color: Colors.white,
                ),
                child:Form(
                  key: controller.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                      children: [
                        SizedBox(
                          height: 40.0,
                        ),
                        CustomText(
                          text: 'LOGIN',
                          fontSize: 35.0,
                          color: Color(0xFFBE0B0B),
                        ),
                        SizedBox(
                          height: 20.0,),
                        CustomText(
                          text: 'Lets login to your account',
                          fontSize: 20.0,
                          color: Color(0xFFD9D9D9),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: 250.0,
                          height: 50.0,
                          child: CustomTextField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction : TextInputAction.next,
                            onSaved: (value) {
                              controller.email = value!;
                            },
                            validator: (value) {
                              return controller.validateEmail(value!);
                            },
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFBE0B0B),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFBE0B0B),
                                ),
                              ),
                            ),

                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 250.0,
                          height: 50.0,
                          child: Obx(()=> CustomTextField(
                            controller: controller.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.isPassword.value,
                            onSaved: (value) {
                              controller.password = value!;
                            },
                            validator: (value) {
                              return controller.validatePassword(value!);
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPassword.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xFFBE0B0B),
                                ),
                                onPressed: () {
                                  controller.changePassword();
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFBE0B0B),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFBE0B0B),
                                ),
                              ),
                            ),
                          ),
                          ),
                        ),
                        SizedBox(
                          height: 90.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomElevatedButton(
                          onPressed: () {
                            onClickLogin();
                          },
                          buttonText: 'LOGIN',
                          buttonColor: Color(0xFFBE0B0B),
                          borderRadius: BorderRadius.circular(20),
                          height: 50.0,
                          fontSize: 18.0,
                          textColor: Colors.white,
                        ),
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClickLogin() async{
    EasyLoading.show(status: "loading...");

    await controller.loginOnClick();

    if(controller.loginStatus){
      EasyLoading.showSuccess(
        controller.message,
        duration: Duration(seconds: 5),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      Get.offAllNamed("/home");
    }else{
      EasyLoading.showError(
        controller.message,
        duration: Duration(seconds: 5),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      print("Error Here");
    }
  }

}