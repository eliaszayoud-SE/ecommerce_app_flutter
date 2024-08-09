import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/verify_code_data.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {

  late String email;

  StatusRequest statusRequest = StatusRequest.none;

  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());

  @override
  checkCode() {}

  @override
  goToResetPassword(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postData(email ,verifyCode);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      Get.offNamed(AppRoute.resetPassword, arguments: {
        'email':email,
        'verifyCode':verifyCode,
      });
    }

    else {
      Get.defaultDialog(
          title: 'error',
          middleText: "verify code is wrong");
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }


}
