import 'package:ecommerce_app/controller/my_favorite_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/data/model/my_favorite_model.dart';
import 'package:ecommerce_app/view/widget/favorite/custom_favorite_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: ListView(
        children: [
          // CustomAppBar(
          //     titleAppBar: 'Find Product',
          //
          //     onPressedSearch: () {},
          //     onPressedIconFavorite: () {}),
          const SizedBox(height: 10,),
          GetBuilder<MyFavoriteController>(builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.favoriteData.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.62,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return CustomFavoriteListItem(itemModel: MyFavoriteModel.fromJson(controller.favoriteData[index]));
                    }
                ));
          })
        ],
      ),
    );
  }
}
