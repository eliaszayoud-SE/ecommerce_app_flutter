import 'package:ecommerce_app/view/widget/auth/custom_material_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/success_sign_up_controller.dart';
import '../../../core/constant/color.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '32'.tr,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              )),
          Text("37".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 30)),
          Text("38".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomMaterialButtonAuth(
                text: "31".tr,
                onPressed: () {
                   controller.goToLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}