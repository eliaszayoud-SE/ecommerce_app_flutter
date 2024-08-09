import 'package:ecommerce_app/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomMaterialButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomMaterialButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: MaterialButton(
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(horizontal: 100),
        color: AppColor.primaryColor,
        onPressed: () {
          controller.next();
        },
        child: const Text('Continue'),
      ),
    );
  }
}
