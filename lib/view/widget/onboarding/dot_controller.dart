import 'package:ecommerce_app/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<OnBoardingControllerImp>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(onBoardingData.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 900),
              margin: const EdgeInsets.only(right: 10),
              width: controller.currentPage == index ? 20:6,
              height: 6,
              decoration: const BoxDecoration(color: AppColor.primaryColor),
            );
          }),
        ],
      );
    });
  }
}
