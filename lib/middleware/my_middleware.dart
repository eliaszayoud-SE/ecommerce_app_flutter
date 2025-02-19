
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware{

  MyServices myServices = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {

    if(myServices.sharedPreferences.getString('step') == "2"){
      return const RouteSettings(name:AppRoute.homePage);
    }

    if(myServices.sharedPreferences.getString('step') == "1"){
      return const RouteSettings(name:AppRoute.login);
    }
  }

}