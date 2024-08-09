
import 'package:get/get.dart';
import '../services/services.dart';

String translateDataBase(String columnEn, String columnAr){
  MyServices myServices = Get.find();
  if(myServices.sharedPreferences.getString('codeLang') == 'ar'){
    return columnAr;
  }
  else{
    return columnEn;
  }
}