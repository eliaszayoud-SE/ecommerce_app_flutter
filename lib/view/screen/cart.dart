import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/widget/cart/custom_bottom_navigation_bar_cart.dart';
import 'package:ecommerce_app/view/widget/cart/top_card_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/cart/custom_items_cart_list.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
          title: const Text('My Cart'),
        centerTitle: true,
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller){
          return CustomBottomNavigationBarCart(
            price: '${controller.orderPrice}',
            discount: '${controller.discount}',
            totalPrice: '${controller.getTotalPrice()}',
            couponTextFormField: controller.couponController!,
            onCoupon: (){
              controller.checkCoupon();
            },
          );
        },
      ),
      body: GetBuilder<CartController>(
        builder: (controller) {
          return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  TopCardCart(
                      message:
                          'You Have ${controller.totalQuantity} Items in Your List'),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(controller.data.length, (index) {
                          return CustomItemsCartList(
                            onPressedAdd: () async {
                              await controller.addToCart('${controller.data[index].product!.id!}');
                              controller.refreshPageView();
                              },
                            onPressedDelete: () async {
                              await controller.deleteFromCart('${controller.data[index].product!.id!}');
                              controller.refreshPageView();
                            },
                            name: controller.data[index].product!.name!,
                            price: controller.data[index].product!.priceWithDiscount!,
                            count: controller.data[index].qty!,
                            imagePath: controller.data[index].product!.image!,
                            discount: controller.data[index].product!.discount == 0 ? false : true,
                          );
                        })
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
