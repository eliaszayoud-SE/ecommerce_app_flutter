import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/token_data.dart';
import 'package:get/get.dart';
import '../services/services.dart';

class Token {
  MyServices myServices = Get.find();
  TokenData tokenData = TokenData(Get.find());
  late StatusRequest statusRequest;
  late String email;
  late String password;

  getAccessToken() async {
    String? accessToken = myServices.sharedPreferences.getString('access');
    return accessToken;
  }

  refreshAccessToken() async {
    String refreshToken = myServices.sharedPreferences.getString('refresh')!;
    var response = await tokenData.getAccessToken(
      {
        'refresh':refreshToken,
      }
    );

    statusRequest = handlingData(response);

    if(statusRequest == StatusRequest.success){
        myServices.sharedPreferences.setString('access', response['access']);
    }
    else if(statusRequest == StatusRequest.refreshTokenExpired){
      email = myServices.sharedPreferences.getString('email')!;
      password = myServices.sharedPreferences.getString('password')!;
      getToken(email, password);
    }
  }

  getToken(String email, String password) async {
    var response = await tokenData.getToken(email, password);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      myServices.sharedPreferences.setString('access', response['access']);
      myServices.sharedPreferences.setString('refresh', response['refresh']);
    }
  }

}
