import 'package:ecommerce_app/core/constant/app_theme.dart';
import 'package:ecommerce_app/core/functions/fcm_config.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ChangeLangController extends GetxController{
  MyServices myServices = Get.find();

  Locale? localLang;
  ThemeData? themeData;

  changeLang(String codeLang){
    localLang = Locale(codeLang);
    myServices.sharedPreferences.setString('codeLang', codeLang);
    themeData = codeLang == 'ar' ? themeArabic : themeEnglish;
    Get.updateLocale(localLang!);
  }

  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      return Get.snackbar('alert', 'Please turn on location services');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar('alert', 'Please give a location permission');
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Get.snackbar('error', 'you can not use application without location');
      }
    }

  }

  requestNotificationPermission() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  @override
  void onInit() {
    requestPermissionLocation();
    requestNotificationPermission();
    fcmConfig();
    String? codeLang = myServices.sharedPreferences.getString('codeLang');
    if(codeLang=='ar'){
      localLang = Locale(codeLang!);
      themeData = themeArabic;
    }
    else if(codeLang == 'en'){
      localLang = Locale(codeLang!);
      themeData = themeEnglish;
    }
    else{
      localLang = Locale(Get.deviceLocale!.languageCode);
      themeData = themeEnglish;
    }
    // TODO: implement onInit
    super.onInit();
  }

}