import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/data/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      // margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.itemsData.length,
          itemBuilder: (context, index) {
            return Item(itemModel: ItemModel.fromJson(controller.itemsData[index]));
          }),
    );
  }
}

class Item extends GetView<HomeControllerImp> {
  final ItemModel itemModel;
  const Item({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToProductDetail(itemModel);
      },
      child: Stack(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  '${itemModel.image}',
                  width: 200,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey.withOpacity(0.3),
            ),
            margin: const EdgeInsets.symmetric(
                horizontal: 10),
            width: 200,
            height: 150,
          ),
          Positioned(
            left: 25,
            child: Text(
              '${itemModel.name}',
              style: const TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}

