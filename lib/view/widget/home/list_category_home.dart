import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ListCategoryHome extends GetView<HomeControllerImp> {
  const ListCategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemCount: controller.categoryData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Category( selectedCategory: index,categoryModel: CategoryModel.fromJson(controller.categoryData[index]),);
          }),
    );
  }
}


class Category extends GetView<HomeControllerImp> {
  final CategoryModel categoryModel;
  final int selectedCategory;
  const Category( {super.key, required this.categoryModel, required this.selectedCategory,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItems(controller.categoryData, selectedCategory, categoryModel.id!);
      },
      child: Column(
        children: [
          Container(
              width: 70,
              height: 70,
              padding:
              const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.thirdColor),
              child: SvgPicture.network(
                '${categoryModel.image}',
                colorFilter: const ColorFilter.mode(
                    AppColor.primaryColor,
                    BlendMode.srcIn),
              )),
          Text(
            translateDataBase(categoryModel.name!, categoryModel.nameAr!),
            style:const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColor.black),
          ),
        ],
      ),
    );
  }
}

