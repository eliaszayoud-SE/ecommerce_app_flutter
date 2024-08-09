import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/sign_up_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/services/services.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController emailController;
  late TextEditingController userNameController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formState = GlobalKey();

  MyServices myServices = Get.find();


  SignUpData signUpData = SignUpData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  bool isPasswordSecure = true;
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  showPassword(){
    isPasswordSecure = !isPasswordSecure;
    update();
  }

  @override
  signUp() async {
    if (formState.currentState!.validate())  {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(userNameController.text,
          emailController.text, passwordController.text, phoneController.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        Get.offNamed(AppRoute.verifyCodeSignUp, arguments: {
          'email':emailController.text
        });
      } else {
        Get.defaultDialog(
            title: 'Warning',
            middleText: "Email or Username or phone is already exists");
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    userNameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
