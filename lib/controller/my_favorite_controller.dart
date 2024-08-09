import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/data/datasource/remote/my_favorite_data.dart';
import 'package:get/get.dart';
import '../core/class/token.dart';
import '../core/functions/handling_data.dart';

class MyFavoriteController extends GetxController {
  Token token = Get.find();

  List favoriteData = [];
  late String? accessToken;
  late StatusRequest statusRequest;
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response = await myFavoriteData.getData(
        {'Authorization': "JWT $accessToken"}
    );
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      favoriteData.addAll(response['items']);
      if(favoriteData.isEmpty){
        statusRequest = StatusRequest.noData;
      }
    }
    else if(statusRequest == StatusRequest.accessTokenExpired){
      await token.refreshAccessToken();
      getData();
    }
    else{
      statusRequest = StatusRequest.failure ;
    }
    update();
  }


  removeFavorite(String productId) async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response = await myFavoriteData.deleteFromFavorite(productId, {
      'Authorization':  "JWT $accessToken"
    });
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.noContent){
      favoriteData.removeWhere((element) => '${element['id']}' == productId);
    }
    else if(statusRequest == StatusRequest.accessTokenExpired){
      await token.refreshAccessToken();
      removeFavorite(productId);
    }
    else{
      statusRequest = StatusRequest.failure ;
    }
    update();
  }
}
