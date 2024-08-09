import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app/data/model/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/token.dart';

abstract class HomeController extends SearchMixController {
  getData();
  goToItems(List categories, int selectedCategory, int categoryId);
}

class HomeControllerImp extends HomeController {

  List categoryData = [];
  List itemsData = [];
  String? title;
  String? body;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();

    var response = await homeData.getData({
      'Authorization': "JWT $accessToken",
    });
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      categoryData.addAll(response['categories']);
      itemsData.addAll(response['items']);
      title = response['settings']['title'];
      body = response['settings']['body'];
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      getData();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  goToProductDetail(ItemModel itemModel){
    Get.toNamed(AppRoute.productDetails,
        arguments: {'itemModel': itemModel});
  }


  @override
  void onInit() {
    textEditingController = TextEditingController();
    getData();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  goToItems(categories, selectedCategory, categoryId) {
    Get.toNamed(AppRoute.items, arguments: {
      'categories': categories,
      'selectedCategory': selectedCategory,
      'categoryId': categoryId
    });
  }
}

class SearchMixController extends GetxController{
  TextEditingController? textEditingController;
  List<ItemModel> searchItems = [];

  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;

  late String? accessToken;
  Token token = Get.find();

  bool isSearch = false;

  checkSearch(val) {
    if (val == '') {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearch() {
    if(textEditingController!.text != ''){
      isSearch = true;
      searchItems.clear();
      searchData();
      update();
    }
  }
  searchData() async {
    statusRequest = StatusRequest.loading;
    update();
    accessToken = await token.getAccessToken();
    var response = await homeData.search({
      'Authorization': "JWT $accessToken",
    }, textEditingController!.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List data = response['items'];
      if(data.isNotEmpty)
      {
        searchItems.addAll(data.map((e) => ItemModel.fromJson(e)));
      }
      else{
        statusRequest = StatusRequest.noData;
      }
    } else if (statusRequest == StatusRequest.accessTokenExpired) {
      await token.refreshAccessToken();
      searchData();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
