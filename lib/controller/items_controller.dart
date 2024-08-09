import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/item_data.dart';
import 'package:ecommerce_app/data/model/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';

abstract class ItemsController extends SearchMixController{
  initialData();
  changeCategory(int val, int categoryId);
  getItem(int catId);
}

class ItemsControllerImp extends ItemsController{

  List categories = [];
  List items = [];
  int? selectedCategory;
  int? categoryId;

  ItemData itemData = ItemData(Get.find());


  @override
  void onInit() {
    initialData();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  changeCategory(val, categoryId) {
    selectedCategory = val;
    getItem(categoryId);
    update();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selectedCategory'];
    categoryId = Get.arguments['categoryId'];
    textEditingController = TextEditingController();
    getItem(categoryId!);
  }

  @override
  getItem(catId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();

    var response = await itemData.getData(catId, headers: {
      'Authorization':  "JWT $accessToken"
    });
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      items.addAll(response['items']);
      if(items.isEmpty){
        statusRequest = StatusRequest.noData;
      }
    }
    else if(statusRequest == StatusRequest.accessTokenExpired){
      await token.refreshAccessToken();
      getItem(catId);
    }
    else{
      statusRequest = StatusRequest.failure ;
    }
    update();
  }

  goToProductDetail(ItemModel itemModel){
    Get.toNamed(AppRoute.productDetails,
        arguments: {'itemModel': itemModel});
  }

}