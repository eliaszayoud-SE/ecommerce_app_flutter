import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce_app/data/model/address_model.dart';
import 'package:get/get.dart';

import '../core/class/token.dart';
import '../core/functions/handling_data.dart';

class CheckOutController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? deliveryType;
  String? addressId;
  Token token = Get.find();
  late String? accessToken;
  List<AddressModel> data = [];
  late int couponId;
  late double orderPrice;
  late int discount;

  choosePaymentMethod(String val) {
     paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  getAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response =
        await addressData.viewAddress({'Authorization': "JWT $accessToken"});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List responseData = response['address'];
      if (responseData.isNotEmpty) {
        data.addAll(responseData.map((e) => AddressModel.fromJson(e)));
      }
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      getAddress();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  checkout() async {

    if(paymentMethod == null) return Get.snackbar('error', 'Please select payment method');
    if(deliveryType == null) return Get.snackbar('error', 'Please select delivery type');
    if(deliveryType == '0' && addressId == null) return Get.snackbar('error', 'Please select delivery address');


    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    Map data = {
      'address_id': addressId ?? '0',
      'type': deliveryType,
      'price_delivery': '100',
      'price': orderPrice.toString(),
      'payment_type': paymentMethod,
      'coupon_id': couponId.toString(),
      'discount_price':discount.toString(),
    };

    var response = await checkoutData
        .checkout(data, {'Authorization': "JWT $accessToken"});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.noContent) {
      Get.offAllNamed(AppRoute.homePage);
      Get.snackbar('success', 'the order was successfully');

    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      checkout();
    } else {
      statusRequest = StatusRequest.failure;
      Get.snackbar('error', 'an error has occurred, Please try again later');
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponId'];
    orderPrice = Get.arguments['orderPrice'];
    discount = Get.arguments['discount'];

    getAddress();
    // TODO: implement onInit
    super.onInit();
  }
}
