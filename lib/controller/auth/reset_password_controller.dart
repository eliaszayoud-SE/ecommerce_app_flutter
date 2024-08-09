import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/reset_password_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {

  late TextEditingController password;
  late TextEditingController rePassword;

  late String email;
  late String verifyCode;

  GlobalKey<FormState> fromState = GlobalKey();
  StatusRequest statusRequest = StatusRequest.none;

  bool isPasswordSecure = true;
  bool isRePasswordSecure = true;

  showPassword(){
    isPasswordSecure = !isPasswordSecure;
    update();
  }

  showRePassword(){
    isRePasswordSecure = !isRePasswordSecure;
    update();
  }

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  @override
  resetPassword() async {
    var formData = fromState.currentState;
    if(password.text != rePassword.text){
      return Get.defaultDialog(
          title: 'error',
          middleText: "password and confirmation password did not match");
    }
    if(formData!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email, verifyCode, password.text);
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        goToSuccessResetPassword();
      }
      else {
        Get.defaultDialog(
            title: 'Warning',
            middleText: "something get wrong please try again letter.");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments['email'];
    verifyCode = Get.arguments['verifyCode'];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}