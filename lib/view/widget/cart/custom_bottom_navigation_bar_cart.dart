import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import 'custom_button_cart.dart';

class CustomBottomNavigationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String totalPrice;
  final TextEditingController couponTextFormField;
  final void Function()? onCoupon;
  const CustomBottomNavigationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalPrice, required this.couponTextFormField, this.onCoupon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(builder: (controller){
          return controller.couponName == null ? Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    flex:2,
                    child: TextFormField(
                        controller: couponTextFormField,
                        decoration: InputDecoration(
                          hintText: 'Coupon Code',
                          hintStyle: const TextStyle(fontSize: 14),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        )
                    )),
                const SizedBox(width: 5,),
                Expanded(
                    flex: 1,
                    child: MaterialButton(
                      height: 48,
                      color: AppColor.primaryColor,
                      onPressed: onCoupon, child: const Text('Apply', style: TextStyle(color: AppColor.white),),))
              ],
            ),
          ) :
          Text('Coupon code ${controller.couponName}', style: const TextStyle(
            fontSize: 20,
            color: AppColor.primaryColor
          ),)
          ;
        }),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '$price \$',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'discount',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '$discount %',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Shpping',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '$discount \$',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Divider(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Price',
                      style: TextStyle(
                          fontSize: 16, color: AppColor.primaryColor),
                    ),
                    Text(
                      '$totalPrice \$',
                      style: const TextStyle(
                          fontSize: 16, color: AppColor.primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        CustomButtonCart(
          textButton: 'Check',
          onPressed: () {
            controller.goToCheckOut();
          },
        ),
      ],
    );
  }
}
