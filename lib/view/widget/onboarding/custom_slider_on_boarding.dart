import 'package:ecommerce_app/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {

          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "${onBoardingData[index].title}",
                style:Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                "${onBoardingData[index].imagePath}",
                width: 200,
                height: 250,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Text(
                  "${onBoardingData[index].body}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          );
        });
  }
}
