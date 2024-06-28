import 'package:admin/appRoute.dart';
import 'package:admin/bindings/allBindings.dart';
import 'package:admin/modules/login/loginScreen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: allBindings(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFBE0B0B),
      ),
      initialRoute: '/splash',
      getPages: appPages,
      //home: homeScreen(),
    );
  }
}
