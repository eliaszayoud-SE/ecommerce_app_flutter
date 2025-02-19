import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{

  MyServices myServices = Get.find();

  logout() {
    String userID = myServices.sharedPreferences.getString('id')!;
    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic('users$userID');
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

}