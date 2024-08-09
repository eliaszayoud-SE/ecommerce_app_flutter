import 'package:ecommerce_app/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(controller.subItems.length, (index)=>Container(
          margin: const EdgeInsets.only(left: 8),
          padding:const EdgeInsets.only(bottom: 5),
          alignment: Alignment.center,
          width: 90,
          height: 60,
          decoration: BoxDecoration(
            color: controller.subItems[index]['active'] == '1' ? AppColor.fourthColor :AppColor.white,
            border: Border.all(
                width: 2, color: AppColor.fourthColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            controller.subItems[index]['name'],
            textAlign: TextAlign.center,
            style: TextStyle(
                color: controller.subItems[index]['active'] == '1' ? AppColor.white :AppColor.fourthColor,
                fontWeight: FontWeight.bold),
          ),
        ),)
      ],
    );
  }
}
