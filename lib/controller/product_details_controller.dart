import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/token.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/cart_data.dart';
import '../data/model/item_model.dart';

abstract class ProductDetailsController extends GetxController {
  initData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemModel itemModel;
  int countCart = 0;
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());
  Token token = Get.find();
  late String? accessToken;

  List subItems = [
    {'name': 'red', 'id': '1', 'active': '1'},
    {'name': 'yellow', 'id': '2', 'active': '0'},
    {'name': 'blue', 'id': '3', 'active': '0'},
  ];

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() async {
    statusRequest = StatusRequest.loading;
    itemModel = Get.arguments['itemModel'];
    countCart = await getCountCart('${itemModel.id}');
    statusRequest = StatusRequest.success;
    update();
  }

  addItem(String productId) async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response = await cartData.addToCart(productId, {
      'Authorization':  "JWT $accessToken"
    });
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      Get.rawSnackbar(
        title: 'اشعار',
        messageText:const  Text('تم إضافة المنتج إلى السلة'),
      );
    }
    else if(statusRequest == StatusRequest.accessTokenExpired){
      await token.refreshAccessToken();
      addItem(productId);
    }
    else{
      statusRequest = StatusRequest.failure ;
    }
    update();
  }

  add() {
    addItem('${itemModel.id}');
    countCart++;
    update();
  }

  getCountCart(String productId) async {
    accessToken = await token.getAccessToken();
    var response = await cartData.getCount(productId, {
      'Authorization':  "JWT $accessToken"
    });
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      int itemCount = response['qty'];
      return itemCount;
    }
    else if(statusRequest == StatusRequest.accessTokenExpired){
      await token.refreshAccessToken();
      getCountCart(productId);
    }
    else{
      statusRequest = StatusRequest.failure ;
    }
  }

  deleteItem(String productId) async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response = await cartData.deleteFromCart(productId, {
      'Authorization':  "JWT $accessToken"
    });
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      Get.rawSnackbar(
        title: 'اشعار',
        messageText:const  Text('تم حذف عنصر من السلة'),
      );
    }

    if(statusRequest == StatusRequest.noContent){
      Get.rawSnackbar(
        title: 'اشعار',
        messageText:const  Text('تم حذف المنتج بشكل كامل من السلة'),
      );
    }

    else if(statusRequest == StatusRequest.accessTokenExpired){
      await token.refreshAccessToken();
      deleteItem(productId);
    }
    else{
      statusRequest = StatusRequest.failure ;
    }
    update();
  }

  remove() {
    if (countCart > 0) {
      deleteItem('${itemModel.id}');
      countCart--;
      update();
    }
  }
}
