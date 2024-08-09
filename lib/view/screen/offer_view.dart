import 'package:ecommerce_app/view/widget/items/custom_list_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../../controller/offers_item_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../../core/constant/routes.dart';
import '../widget/custom_app_bar.dart';
import 'home_page.dart';

class OfferView extends StatelessWidget {
  const OfferView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersItemController offersItemController = Get.put(OffersItemController());
    FavoriteController controllerFavorite = Get.put(FavoriteController());
    return GetBuilder<OffersItemController>(builder: (controller)=>ListView(
      children: [
        CustomAppBar(
          titleAppBar: 'Find Product',
          onChanged: (val) {
            controller.checkSearch(val);
          },
          textEditingController: controller.textEditingController!,
          onPressedSearch: () {
            controller.onSearch();
          },
          onPressedIconFavorite: () {
            Get.toNamed(AppRoute.myFavorite);
          },
        ),
        HandlingDataRequest(
          statusRequest:  offersItemController.statusRequest,
          widget: !controller.isSearch ? Container(
            margin: const EdgeInsets.all(10),
            child: ListView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.offersItem.length,
                itemBuilder: (context, index){
                  controllerFavorite.itemFavorite[
                  '${controller.offersItem[index].id}'] =
                      controller.offersItem[index].isFavorite;
                  return CustomListItems(itemModel: controller.offersItem[index]);
                }),
          ) :
                 ListItemSearch(searchList: controller.searchItems)
      )],
    ));
  }
}

