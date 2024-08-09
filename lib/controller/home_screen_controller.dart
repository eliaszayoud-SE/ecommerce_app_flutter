import 'package:ecommerce_app/view/screen/home_page.dart';
import 'package:ecommerce_app/view/screen/offer_view.dart';
import 'package:ecommerce_app/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/notification/view_notification.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {

  int currentPage = 0;

  List<Widget> page = [
    const HomePage(),
    const ViewNotification(),
    const OfferView(),
    const Settings(),
  ];

  List bottomAppBar = [
    {'title':'home','icon':Icons.home},
    {'title':'notification','icon':Icons.notifications},
    {'title':'offer','icon':Icons.local_offer},
    {'title':'settings','icon':Icons.settings},
  ];

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
