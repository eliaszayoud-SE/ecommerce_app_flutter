import 'package:ecommerce_app/controller/on_boarding_controller.dart';
import 'package:ecommerce_app/view/widget/onboarding/custom_material_button.dart';
import 'package:ecommerce_app/view/widget/onboarding/custom_slider_on_boarding.dart';
import 'package:ecommerce_app/view/widget/onboarding/dot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(flex: 3, child: CustomSliderOnBoarding()),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
                  Spacer(
                    flex: 1,
                  ),
                  CustomMaterialButtonOnBoarding(),
                ],
              )),
        ],
      ),
    ));
  }
}
