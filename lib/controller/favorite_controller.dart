import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

import '../core/class/token.dart';
import '../core/functions/handling_data.dart';

class FavoriteController extends GetxController{
  Map itemFavorite = {};

  late StatusRequest statusRequest;
  Token token = Get.find();
  late String? accessToken;
  FavoriteData favoriteData = FavoriteData(Get.find());

  isFavorite(int itemId, bool value){
    itemFavorite['$itemId'] = value;
    update();
  }

  addFavorite(String productId) async {

    statusRequest = StatusRequest.loading;

    accessToken = await token.getAccessToken();
    var response = await favoriteData.addToFavorite(productId, {
      'Authorization':  "JWT $accessToken"
    });
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.noContent){

    }
    else if(statusRequest == StatusRequest.accessTokenExpired){
      await token.refreshAccessToken();
      addFavorite(productId);
    }
    else{
      statusRequest = StatusRequest.failure ;
    }

  }

  removeFavorite(String productId) async {
    statusRequest = StatusRequest.loading;

    accessToken = await token.getAccessToken();
    var response = await favoriteData.deleteFromFavorite(productId, {
      'Authorization':  "JWT $accessToken"
    });
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.noContent){

    }
    else if(statusRequest == StatusRequest.accessTokenExpired){
      await token.refreshAccessToken();
      addFavorite(productId);
    }
    else{
      statusRequest = StatusRequest.failure ;
    }
  }

}