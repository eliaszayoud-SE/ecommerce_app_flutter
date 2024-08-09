import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/data/datasource/remote/offer_data.dart';
import 'package:ecommerce_app/data/model/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/functions/handling_data.dart';
import 'home_controller.dart';

class OffersItemController extends SearchMixController {

  List<ItemModel> offersItem = [];

  OfferData offerData = OfferData(Get.find());

  @override
  void onInit() async {
    textEditingController = TextEditingController();
    await getOffersItem();
    super.onInit();
  }

  getOffersItem() async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response = await offerData.getOffersItem(
        {'Authorization': "JWT $accessToken"}
    );
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      List responseData = response['items'];
      if(responseData.isNotEmpty){
          offersItem.addAll(responseData.map((e)=>ItemModel.fromJson(e)));
      }
      else {
        statusRequest = StatusRequest.noData;
      }
    }
    else if(statusRequest == StatusRequest.accessTokenExpired){
      await token.refreshAccessToken();
      getOffersItem();
    }
    else{
      statusRequest = StatusRequest.failure ;
    }
    update();
  }

}
