import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/token.dart';
import '../../core/functions/handling_data.dart';

class CompleteAddController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? city;
  TextEditingController? name;
  TextEditingController? phone;
  TextEditingController? street;
  double? lat;
  double? long;

  AddressData addressData = AddressData(Get.find());
  Token token = Get.find();
  late String? accessToken;

  initData() {
    city = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  addData() async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response = await addressData.addAddress(
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!,
        phone!.text,
        {'Authorization': "JWT $accessToken"});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.offAllNamed(AppRoute.homePage);
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      addData();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    initData();
    // TODO: implement onInit
    super.onInit();
  }
}
