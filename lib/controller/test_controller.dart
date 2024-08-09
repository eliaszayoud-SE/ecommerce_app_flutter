import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

import '../core/functions/handling_data.dart';

class TestController extends GetxController{
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getDate();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      data.add(response);
    }
    update();
  }

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

}