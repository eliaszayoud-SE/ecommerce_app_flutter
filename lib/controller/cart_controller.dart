import 'package:ecommerce_app/core/class/token.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/model/cart_model.dart';
import 'package:ecommerce_app/data/model/coupon_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  TextEditingController? couponController;
  late StatusRequest statusRequest;
  Token token = Get.find();
  late String? accessToken;
  int discount = 0;
  String? couponName;
  int? couponId;


  List<CartModel> data = [];

  CouponModel? couponModel;

  int totalQuantity = 0;
  double orderPrice = 0;

  resetVarCart() {
    totalQuantity = 0;
    orderPrice = 0;
  }

  refreshPageView() {
    resetVarCart();
    viewCart();
  }

  getTotalPrice() {
    return orderPrice - (orderPrice * discount / 100);
  }

  goToCheckOut(){
    if(data.isEmpty) return Get.snackbar('alert', 'The Cart is empty');
    Get.toNamed(AppRoute.checkOut, arguments: {
      'orderPrice':orderPrice,
      'couponId':couponId ?? 0,
      'discount':discount
    });
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response = await cartData.checkCoupon(
        couponController!.text, {'Authorization': "JWT $accessToken"});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      couponModel = CouponModel.fromJson(response);
      discount = couponModel!.discount!;
      couponName = couponModel!.name!;
      couponId = couponModel!.id!;
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      checkCoupon();
    } else {
      discount = 0;
      couponName = null;
      couponId = null;
      Get.snackbar('error', 'The coupon dose not found');
    }
    update();
  }

  addToCart(String productId) async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response = await cartData
        .addToCart(productId, {'Authorization': "JWT $accessToken"});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.rawSnackbar(
        title: 'اشعار',
        messageText: const Text('تم إضافة المنتج إلى السلة'),
      );
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      addToCart(productId);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  deleteFromCart(String productId) async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response = await cartData
        .deleteFromCart(productId, {'Authorization': "JWT $accessToken"});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.rawSnackbar(
        title: 'اشعار',
        messageText: const Text('تم حذف عنصر من السلة'),
      );
    }

    if (statusRequest == StatusRequest.noContent) {
      Get.rawSnackbar(
        title: 'اشعار',
        messageText: const Text('تم حذف المنتج بشكل كامل من السلة'),
      );
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      deleteFromCart(productId);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  viewCart() async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response =
        await cartData.viewCart({'Authorization': "JWT $accessToken"});
    data.clear();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List responseData = response['cart'];
      if (responseData.isNotEmpty) {
        data.addAll(responseData.map((e) => CartModel.fromJson(e)));
        totalQuantity = response['total_quantity'];
        orderPrice = response['total_price'];
      } else {
        statusRequest = StatusRequest.noData;
      }
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      viewCart();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    couponController = TextEditingController();
    viewCart();
    super.onInit();
  }
}
