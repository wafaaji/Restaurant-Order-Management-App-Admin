import 'package:admin/components/customText.dart';
import 'package:admin/modules/splash/splashController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashScreen extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {

    print (controller.loading);

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    CustomText(
                      text: "F A T  C H E E F",
                      fontSize: 30.0,
                      color: Color(0xFFBE0B0B),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CustomText(
                      text: "Admin Application",
                      fontSize: 20.0,
                      color: Color(0xFFD9D9D9),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                child:CircularProgressIndicator(
                  color: Color(0xFFBE0B0B),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
