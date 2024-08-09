import 'dart:async';

import 'package:ecommerce_app/data/datasource/remote/order/order_details_data.dart';
import 'package:ecommerce_app/data/model/order_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/status_request.dart';
import '../../core/class/token.dart';
import '../../core/functions/handling_data.dart';

class OrderDetailsController extends GetxController {
  late OrderModel orderModel;
  late StatusRequest statusRequest;
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());

  Completer<GoogleMapController>? completerController;
  // Position? position;
  List<Marker> marker = [];
  CameraPosition? cameraPosition;
  double? lat;
  double? long;
  List data = [];
  Token token = Get.find();
  late String? accessToken;

  initData() {
    if(orderModel.address != null){
      lat = orderModel.address!.lat;
      long = orderModel.address!.long;
      cameraPosition =  CameraPosition(
        target: LatLng(lat!, long!),
        zoom: 5,
      );
      marker.add(Marker(markerId: const MarkerId('1'), position: LatLng(lat!, long!)));
    }
    getOrderDetails();
  }

  getOrderDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response =
        await orderDetailsData.getOrderDetails(orderModel.id.toString(),{'Authorization': "JWT $accessToken"});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data.addAll(response['order_details']);
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      getOrderDetails();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    initData();
    super.onInit();
  }
}
