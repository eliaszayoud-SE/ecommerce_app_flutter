import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        Positioned(
          top: 40,
          left: Get.width / 8,
          right: Get.width / 8,
          child: Hero(
            tag: '${controller.itemModel.id}',
            child: CachedNetworkImage(
              imageUrl: '${controller.itemModel.image}',
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
