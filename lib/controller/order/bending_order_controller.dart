import 'package:ecommerce_app/data/datasource/remote/order/bending_order_data.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/class/token.dart';
import '../../core/functions/handling_data.dart';
import '../../data/model/order_model.dart';

class BendingOrderController extends GetxController{
  BendingOrderData bendingOrderData = BendingOrderData(Get.find());
  late StatusRequest statusRequest;
  Token token = Get.find();
  late String? accessToken;
  List<OrderModel> data = [];

  String printOrderType(int val){
    if(val == 0){
      return 'delivery';
    }
    return 'Receive';
  }

  String printPaymentType(int val){
    if(val == 0){
      return 'Cash';
    }
    return 'Card';
  }

  String printOrderStatus(int val){
    if(val == 0){
      return 'Pending Approval';
    }
    else if(val==1){
      return 'The Order is Being Prepared';
    }

    else if(val==2){
      return 'On the Way';
    }
    else {
      return 'Archive';
    }

  }

  getBendingData() async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response =
    await bendingOrderData.getBendingOrder({'Authorization': "JWT $accessToken"});
    data.clear();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List responseData = response['order'];
      if (responseData.isNotEmpty) {
        data.addAll(responseData.map((e) => OrderModel.fromJson(e)));

      } else {
        statusRequest = StatusRequest.noData;
      }
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      getBendingData();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  deleteOrder(String orderId) async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response =
    await bendingOrderData.deleteOrder(orderId,{'Authorization': "JWT $accessToken"});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.noContent) {
      refreshPage();
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      deleteOrder(orderId);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  refreshPage(){
    getBendingData();
  }

  @override
  void onInit() {
    getBendingData();
    // TODO: implement onInit
    super.onInit();
  }

}