import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/forget_password_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController emailController;

  GlobalKey<FormState> formState = GlobalKey();

  StatusRequest statusRequest = StatusRequest.none;
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());

  @override
  goToVerifyCode() {
    Get.offNamed(AppRoute.verifyCode, arguments: {
      'email':emailController.text,
    });
  }

  @override
  checkEmail() async {
    var formData = formState.currentState;
    if(formData!.validate()){
      statusRequest = StatusRequest.loading;
      update();

      var response = await forgetPasswordData.postData(emailController.text);
      statusRequest = handlingData(response);

      if(statusRequest == StatusRequest.success){
        goToVerifyCode();
      }
      else {
        Get.defaultDialog(
            title: 'error',
            middleText: "Email is not found");
        statusRequest = StatusRequest.failure;
      }

      update();

    }
    else{
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
