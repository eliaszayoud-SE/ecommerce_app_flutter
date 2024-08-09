import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/constant/image_path.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/data/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemModel itemModel;
  const CustomListItems({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetail(itemModel);
      },
      child: Card(
          child: Stack(
            children:[ Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: '${itemModel.id}',
                child: CachedNetworkImage(
                  imageUrl: '${itemModel.image}',
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                translateDataBase(itemModel.name!, itemModel.nameAr!),
                style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
             
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${itemModel.priceWithDiscount} \$',
                    style: const TextStyle(
                        color: AppColor.primaryColor, fontSize: 18),
                  ),

                  GetBuilder<FavoriteController>(builder: (controller) {
                    return IconButton(iconSize: 30,
                        onPressed: () async {
                          if (controller.itemFavorite['${itemModel.id}']) {
                            await controller.removeFavorite('${itemModel.id!}');
                            controller.isFavorite(itemModel.id!, false);
                          } else {
                            await controller.addFavorite('${itemModel.id!}');
                            controller.isFavorite(itemModel.id!, true);
                          }
                        },
                        icon: Icon(
                          controller.itemFavorite['${itemModel.id}']!
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: AppColor.primaryColor,
                        ));
                  }),
                ],
              )
            ],
                    ),
                  ),
            if(itemModel.discount != 0)Image.asset(AppImagePath.sale, width: 40,)
            ],

          )),
    );
  }
}
