import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/custom_material_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../../core/functions/valid_input.dart';
import '../../../core/shared/custom_text_form_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());

    return Scaffold(
        appBar: AppBar(
          title: Text(
            '17'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (bool b) {
            alertExitApp();
          },
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) {
              return HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                            CustomTextTitleAuth(title: "10".tr),
                            CustomTextBodyAuth(
                              body: "24".tr,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextFormField(
                                validator: (value) {
                                  return validInput(value!, 5, 30, 'username');
                                },
                                isNumber: false,
                                textEditingController:
                                    controller.userNameController,
                                hintText: "23".tr,
                                labelText: "20".tr,
                                iconData: Icons.person_outline),
                            CustomTextFormField(
                                validator: (value) {
                                  return validInput(value!, 5, 100, 'email');
                                },
                                isNumber: false,
                                textEditingController:
                                    controller.emailController,
                                hintText: "12".tr,
                                labelText: "18".tr,
                                iconData: Icons.email_outlined),
                            CustomTextFormField(
                                validator: (value) {
                                  return validInput(value!, 5, 30, 'phone');
                                },
                                isNumber: true,
                                textEditingController:
                                    controller.phoneController,
                                hintText: "22".tr,
                                labelText: "21".tr,
                                iconData: Icons.phone_android_outlined),
                            CustomTextFormField(
                                validator: (value) {
                                  return validInput(value!, 8, 30, 'password');
                                },
                                onTap: (){
                                  controller.showPassword();
                                },
                                obscureText: controller.isPasswordSecure,
                                isNumber: false,
                                textEditingController: controller.passwordController,
                                hintText: "13".tr,
                                labelText: "19".tr,
                                iconData: Icons.lock_outline),
                            CustomMaterialButtonAuth(
                              text: "17".tr,
                              onPressed: () {
                                controller.signUp();
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("25".tr),
                                InkWell(
                                    onTap: () {
                                      controller.goToLogin();
                                    },
                                    child: Text(
                                      "26".tr,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor),
                                    ))
                              ],
                            )
                          ],
                        ),
                      )));
            },
          ),
        ));
  }
}
