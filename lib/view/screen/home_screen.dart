import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/home/custom_bottom_app_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screen_controller.dart';
import '../../core/functions/alert_exit_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller){
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: (){
            Get.toNamed(AppRoute.cart);
          },
          child: const Icon(Icons.shopping_basket_outlined, color: AppColor.white,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: PopScope(
            canPop: false,
            onPopInvoked: (bool b) {
              alertExitApp();
            },
          child: controller.page.elementAt(controller.currentPage),
        )






      );
    });
  }
}
