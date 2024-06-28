import 'package:admin/model/loginModel.dart';
import 'package:admin/modules/login/loginService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController , passwordController;
  var email = '';
  var password = '';
  RxBool isPassword = true.obs;

  //for login
  late LoginService service;
  var loginStatus;
  var message;

  @override
  void onInit(){
    emailController = TextEditingController();
    passwordController = TextEditingController();

    service = LoginService();
    loginStatus = false;
    message = '';

    super.onInit() ;
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();

    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail (String value)
  {
    if (!GetUtils.isEmail(value))
    {
      return 'Please provide valid Email';
    }
    return null;
  }

  String? validatePassword (String value)
  {
    if (value.length < 8)
    {
      return 'Password must be of 8 characters';
    }
    return null;
  }


  void changePassword (){
    isPassword.value = !isPassword.value;
    update();
  }

  Future<void> loginOnClick() async{
    email = emailController.text;
    password = passwordController.text;
    Login login = Login(
      email: email,
      password: password,
    );
    print("______________login________________");
    loginStatus = await service.login(login);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

}