import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/custom_app_bar.dart';
import 'package:ecommerce_app/view/widget/home/custom_card_home.dart';
import 'package:ecommerce_app/view/widget/home/custom_title_home.dart';
import 'package:ecommerce_app/view/widget/home/list_items_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/item_model.dart';
import '../widget/home/list_category_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return ListView(
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
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ?  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                       if(controller.title != '')  CustomCardHome(
                            title: controller.title, body: controller.body),
                        const CustomTitleHome(title: 'Categories'),
                        const ListCategoryHome(),
                        const CustomTitleHome(title: 'Top Selling'),
                        const ListItemsHome(),
                        
                      ],
                    )
                  : ListItemSearch(searchList: controller.searchItems),
            )
          ],
        );
      },
    );
  }
}

class ListItemSearch extends StatelessWidget {
  final List<ItemModel> searchList;
  const ListItemSearch({super.key, required this.searchList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Get.toNamed(AppRoute.productDetails,
                  arguments: {'itemModel': searchList[index]});
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: AppColor.white,
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                        imageUrl: searchList[index].image!,
                      )),
                      Expanded(
                        flex: 2,
                          child: ListTile(
                        title: Text(searchList[index].name!),
                        subtitle: Text(searchList[index].category!.name!),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
