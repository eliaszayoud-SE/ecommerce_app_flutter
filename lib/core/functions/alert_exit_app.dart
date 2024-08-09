import 'dart:io';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:get/get.dart';

alertExitApp(){

 Get.defaultDialog(
  title: 'Warning',
  middleText: 'are you sure exit the app',
  onCancel: (){},
     onConfirm: (){
       exit(0);
     },
   buttonColor: AppColor.primaryColor
);

}