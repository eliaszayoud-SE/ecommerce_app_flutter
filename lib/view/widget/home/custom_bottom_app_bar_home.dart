import 'package:ecommerce_app/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_button_bottom_app_bar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(builder: (controller){
      return BottomAppBar(
        shape: const CircularNotchedRectangle(
        ),
        notchMargin: 15,
        child: Row(
          children: [
            ...List.generate(controller.page.length + 1, (index) {
              int i = index > 2 ? index-1:index;
              return index == 2 ? const Spacer() : CustomButtonBottomAppBar(text: controller.bottomAppBar[i]['title'], iconData: controller.bottomAppBar[i]['icon'], onPressed: (){
                controller.changePage(i);
              },
                active: controller.currentPage == (i) ? true:false ,
              );
            }),
          ],
        ),
      );
    });
  }
}
