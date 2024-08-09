import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Category( selectedCategory: index,categoryModel: CategoryModel.fromJson(controller.categories[index]),);
          }),
    );
  }
}


class Category extends GetView<ItemsControllerImp> {
  final CategoryModel categoryModel;
  final int selectedCategory;
  const Category( {super.key, required this.categoryModel, required this.selectedCategory,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.changeCategory(selectedCategory, categoryModel.id!);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<ItemsControllerImp>(builder: (controller){
            return Container(
              padding : const EdgeInsets.only(right: 10, left: 10, bottom: 5),
              decoration: controller.selectedCategory == selectedCategory ? const BoxDecoration(
                  border:  Border(bottom: BorderSide(width: 3, color: AppColor.primaryColor))
              ) : null,
              child: Text(
                translateDataBase(categoryModel.name!, categoryModel.nameAr!),
                style:const TextStyle(
                    fontSize: 18,
                    color: AppColor.grey2),
              ),);
          }),
        ],
      ),
    );
  }
}

