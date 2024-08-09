import 'package:ecommerce_app/controller/auth/forget_password_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/custom_material_button_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/valid_input.dart';
import '../../../core/shared/custom_text_form_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '14'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
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
                          CustomTextTitleAuth(title: '27'.tr),
                          CustomTextBodyAuth(
                            body: "29".tr,
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
                              hintText: '12'.tr,
                              labelText: '18'.tr,
                              iconData: Icons.email_outlined),
                          CustomMaterialButtonAuth(
                            text: '30'.tr,
                            onPressed: () {
                              controller.checkEmail();
                            },
                          ),
                        ],
                      ),
                    )));
          },
        ));
  }
}
