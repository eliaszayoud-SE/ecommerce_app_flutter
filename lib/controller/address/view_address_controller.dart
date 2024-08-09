import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:get/get.dart';

import '../../core/class/token.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/address_data.dart';
import '../../data/model/address_model.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  Token token = Get.find();
  late String? accessToken;
  late StatusRequest statusRequest;
  List<AddressModel> data = [];

  deleteAddress(int addressID) async {
    data.removeWhere((element) => element.id == addressID);
    update();
    accessToken = await token.getAccessToken();
    var response = await addressData
        .deleteAddress(addressID, {'Authorization': "JWT $accessToken"});
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      deleteAddress(addressID);
    }
  }

  getData() async {
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
      } else {
        statusRequest = StatusRequest.noData;
      }
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      getData();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
