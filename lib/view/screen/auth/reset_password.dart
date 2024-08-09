import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/custom_material_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/reset_password_controller.dart';
import '../../../core/functions/valid_input.dart';
import '../../../core/shared/custom_text_form_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Reset Password',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.fromState,
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(title: "35".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(body: "35".tr),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                          validator: (value) {
                            return validInput(value!, 8, 30, 'password');
                          },
                          onTap: (){
                            controller.showPassword();
                          },
                          obscureText: controller.isPasswordSecure,
                          isNumber: false,
                          textEditingController: controller.password,
                          hintText: "13".tr,
                          labelText: "19".tr,
                          iconData: Icons.lock_outline),
                      CustomTextFormField(
                          validator: (value) {
                            return validInput(value!, 8, 30, 'password');
                          },
                          onTap: (){
                            controller.showRePassword();
                          },
                          obscureText: controller.isRePasswordSecure,
                          isNumber: false,
                          textEditingController: controller.rePassword,
                          hintText: "13".tr,
                          labelText: "19".tr,
                          iconData: Icons.lock_outline),
                      CustomMaterialButtonAuth(
                          text: "33".tr,
                          onPressed: () {
                            controller.resetPassword();
                          }),
                      const SizedBox(height: 40),
                    ]),
                  ),
                ));
          },
        ));
  }
}
