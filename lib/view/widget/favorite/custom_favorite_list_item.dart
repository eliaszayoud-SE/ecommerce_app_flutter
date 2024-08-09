import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/my_favorite_controller.dart';
import 'package:ecommerce_app/data/model/my_favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translate_database.dart';

class CustomFavoriteListItem extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemModel;
  const CustomFavoriteListItem({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        // Get.toNamed(AppRoute.productDetails,
        //     arguments: {'itemModel': itemModel});
      },
      child: Card(
        margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Rating 3.5',
                        style: TextStyle(color: AppColor.black, fontSize: 13)),
                    Row(
                      children: [
                        ...List.generate(
                            5,
                                (index) => const Icon(
                              Icons.star,
                              size: 14,
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${itemModel.price} \$',
                      style: const TextStyle(
                          color: AppColor.primaryColor, fontSize: 18),
                    ),

                   IconButton(onPressed: () async {
                     await controller.removeFavorite('${itemModel.id}');
                   }, icon: const Icon(
                     Icons.delete_outline_outlined,
                     color: AppColor.primaryColor,
                   ))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
