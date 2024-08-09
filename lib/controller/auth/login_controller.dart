import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login_data.dart';
import 'package:ecommerce_app/data/datasource/remote/user_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/token.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  Token token = Get.find();
  late String? accessToken;

  bool isPasswordSecure = true;

  MyServices myServices = Get.find();

  UserData userData = UserData(Get.find());

  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  showPassword(){
    isPasswordSecure = !isPasswordSecure;
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  login() async {
    if (formKey.currentState!.validate())  {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(emailController.text, passwordController.text);
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){

          myServices.sharedPreferences.setString('access', response['access']);
          myServices.sharedPreferences.setString('refresh', response['refresh']);
          myServices.sharedPreferences.setString('email', emailController.text);
          myServices.sharedPreferences.setString('password', passwordController.text);
          myServices.sharedPreferences.setString('step', '2');
          await getUserInfo();
          int userID = myServices.sharedPreferences.getInt('id')!;
          FirebaseMessaging.instance.subscribeToTopic('users');
          FirebaseMessaging.instance.subscribeToTopic('users$userID');
          Get.offNamed(AppRoute.homePage);
      }
      else {
        Get.defaultDialog(
            title: 'Warning',
            middleText: "Email or Password  is wrong");
        statusRequest = StatusRequest.failure;
    }
    }
    update();
  }

  getUserInfo() async {
    accessToken = await token.getAccessToken();
    var response = await loginData.getUserInfo({'Authorization': "JWT $accessToken"});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.accessTokenExpired) {
    await token.refreshAccessToken();
    getUserInfo();
    }

    myServices.sharedPreferences.setInt('id', response['id']);
    myServices.sharedPreferences.setString('username', response['username']);
    myServices.sharedPreferences.setString('phone', response['phone']);

  }

  @override
  void onInit() {

    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();

  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
