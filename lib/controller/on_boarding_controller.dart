import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController{

  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();


  @override
  next() {
    currentPage++;
    if(currentPage > onBoardingData.length -1){
        myServices.sharedPreferences.setString('step', "1");
        Get.offAllNamed(AppRoute.login);
    }
    pageController.animateToPage(currentPage, duration:const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    // TODO: implement onInit
    super.onInit();
  }

}
