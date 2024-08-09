import 'package:ecommerce_app/controller/auth/verify_code_sign_up_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Verification Code',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListView(
                      children: [
                        const CustomTextTitleAuth(title: 'Check code'),
                        CustomTextBodyAuth(
                          body:
                              'Please Enter The Digit Code Sent To ${controller.email}',
                        ),
                        OtpTextField(
                          numberOfFields: 5,
                          fieldWidth: 50,
                          borderWidth: 2,
                          borderRadius: BorderRadius.circular(10),
                          borderColor: const Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessSignUp(verificationCode);
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
