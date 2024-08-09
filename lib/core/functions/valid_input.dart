

import 'package:get/get.dart';

validInput(String value, int min, int max, String? type){

    if(type == 'username'){
      if(!GetUtils.isUsername(value)){
        return '42'.tr;
      }
    }

    if(type == 'email'){
      if(!GetUtils.isEmail(value)){
        return '43'.tr;
      }
    }

    if(type == 'phone'){
      if(!GetUtils.isPhoneNumber(value)){
        return '44'.tr;
      }
    }

    if(value.isEmpty){
      return '45'.tr;
    }

    if(value.length < min){
      return '${'46'.tr} $min';
    }

    if(value.length > max){
      return '${'47'.tr} $max';
    }
}