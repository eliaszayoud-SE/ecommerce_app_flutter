import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/data/model/item_model.dart';
import 'package:ecommerce_app/view/widget/custom_app_bar.dart';
import 'package:ecommerce_app/view/widget/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/items/custom_list_items.dart';
import 'home_page.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp itemsControllerImp = Get.put(ItemsControllerImp());
    FavoriteController controllerFavorite = Get.put(FavoriteController());
    return Scaffold(body: GetBuilder<ItemsControllerImp>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.all(15),
          child: ListView(children: [
            CustomAppBar(onChanged: (val){
              itemsControllerImp.checkSearch(val);
            },
                textEditingController: itemsControllerImp.textEditingController!,
                titleAppBar: 'Find Product',
                onPressedSearch: () {
                itemsControllerImp.onSearch();
                },
                onPressedIconFavorite: () {}),
            const SizedBox(
              height: 20,
            ),
            const ListCategoriesItems(),
            HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: !itemsControllerImp.isSearch ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.items.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.6),
                    itemBuilder: (BuildContext context, int index) {
                      controllerFavorite.itemFavorite[
                      '${controller.items[index]['id']}'] =
                      controller.items[index]['is_favorite'];
                      return CustomListItems(
                          itemModel:
                          ItemModel.fromJson(controller.items[index]));
                    })
                    :
                ListItemSearch(searchList: itemsControllerImp.searchItems,)

            )
          ]),
        );
      },
    ));
  }
}
