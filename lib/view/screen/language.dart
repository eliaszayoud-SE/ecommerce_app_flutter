import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/changelang.dart';
import '../widget/language/custtombuttonlang.dart';

class Language extends GetView<ChangeLangController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
           Text('1'.tr, style:Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(height: 5,),
          CustomButtonLang(textButton: 'Ar',onPressed: (){
            controller.changeLang('ar');
            Get.toNamed(AppRoute.onBoarding);
          },),
          CustomButtonLang(textButton: 'En',onPressed: (){
            controller.changeLang('en');
            Get.toNamed(AppRoute.onBoarding);
          },),
        ],
      ),
    );
  }
}
