import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/functions/alert_exit_app.dart';
import 'package:ecommerce_app/core/functions/valid_input.dart';
import 'package:ecommerce_app/view/widget/auth/custom_logo_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_material_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/custom_text_form_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '26'.tr,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<LoginControllerImp>(builder: (controller){
        return PopScope(
          canPop: false,
          onPopInvoked: (bool b){
            alertExitApp();
          },
          child : HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    children: [
                      const CustomLogoAuth(),
                      CustomTextTitleAuth(title: "10".tr),
                      CustomTextBodyAuth(
                        body: "11".tr,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                          validator: (value) {
                            return validInput(value!, 5, 100, 'email');
                          },
                          isNumber: false,
                          textEditingController: controller.emailController,
                          hintText: "12".tr,
                          labelText: "18".tr,
                          iconData: Icons.email_outlined),
                      GetBuilder<LoginControllerImp>(builder: (controller){
                        return CustomTextFormField(
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
                            iconData: Icons.lock_outline);
                      }),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "14".tr,
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      CustomMaterialButtonAuth(
                        text: "15".tr,
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("16".tr),
                          InkWell(
                              onTap: () {
                                controller.goToSignUp();
                              },
                              child: Text(
                                '17'.tr,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ))
                        ],
                      )
                    ],
                  ),
                )),
          )
        );
      },),
    );
  }
}
