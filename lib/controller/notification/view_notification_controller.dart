import 'package:ecommerce_app/data/datasource/remote/notification/notification_data.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/class/token.dart';
import '../../core/functions/handling_data.dart';

class ViewNotificationController extends GetxController{
  NotificationData notificationData = NotificationData(Get.find());
  late StatusRequest statusRequest;
  Token token = Get.find();
  late String? accessToken;
   List data = [];

  viewNotification() async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response =
    await notificationData.viewAddress({'Authorization': "JWT $accessToken"});
    // data.clear();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List responseData = response['notification'];

      if (responseData.isNotEmpty) {
        data.addAll(responseData);
      } else {
        statusRequest = StatusRequest.noData;
      }
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      viewNotification();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    viewNotification();
    // TODO: implement onInit
    super.onInit();
  }

}