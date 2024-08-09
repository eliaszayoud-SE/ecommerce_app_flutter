import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth/verify_code_controller.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '39'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListView(
                      children: [
                        CustomTextTitleAuth(title: '40'.tr),
                        CustomTextBodyAuth(
                          body:
                              'Please Enter The Digit Code Sent To ${controller.email}',
                        ),
                        OtpTextField(
                          numberOfFields: 5,
                          fieldWidth: 50,
                          borderWidth: 2,
                          borderRadius: BorderRadius.circular(20),
                          borderColor: const Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goToResetPassword(verificationCode);
                          }, // end onSubmit
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    )));
          },
        ));
  }
}
