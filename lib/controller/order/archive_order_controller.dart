import 'package:ecommerce_app/data/datasource/remote/order/archive_order_data.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/class/token.dart';
import '../../core/functions/handling_data.dart';
import '../../data/model/order_model.dart';

class ArchiveOrderController extends GetxController{
  ArchiveOrderData archiveOrderData = ArchiveOrderData(Get.find());
  late StatusRequest statusRequest;
  Token token = Get.find();
  late String? accessToken;
  List<OrderModel> data = [];
  int? ratingOrderId ;

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
      return 'The order has been delivered';
    }

  }

  getArchiveData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response =
    await archiveOrderData.getArchiveOrder({'Authorization': "JWT $accessToken"});

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
      getArchiveData();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  submitRatingOrder(int orderId, int rating, String note) async {
    ratingOrderId = orderId;
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response =
    await archiveOrderData.addRating(
    orderId.toString(),
    rating.toString(),
    note,
        {'Authorization': "JWT $accessToken"});

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {

      refreshArchiveData();
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      submitRatingOrder(orderId, rating, note);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  refreshArchiveData(){
    getArchiveData();
  }

  @override
  void onInit() {
    getArchiveData();
    // TODO: implement onInit
    super.onInit();
  }
}