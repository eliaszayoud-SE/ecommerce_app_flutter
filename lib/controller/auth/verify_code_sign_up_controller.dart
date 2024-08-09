import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/verify_code_sign_up_data.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/functions/handling_data.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifyCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {


  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(email!, verifyCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.offNamed(AppRoute.successSignUp);
    }
    else {
      Get.defaultDialog(
          title: 'Warning',
          middleText: "Verify code is wrong");
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
