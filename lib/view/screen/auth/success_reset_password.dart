import 'package:ecommerce_app/controller/auth/success_reset_password_controller.dart';
import 'package:ecommerce_app/view/widget/auth/custom_material_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Success',
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
          Text("37".tr , style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 30)),
          Text("36".tr),
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