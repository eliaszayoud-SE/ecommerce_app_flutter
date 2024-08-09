import 'package:ecommerce_app/controller/check_out_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/image_path.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/checkout/card_payment_method_checkout.dart';
import 'package:ecommerce_app/view/widget/checkout/card_shipping_address_checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/checkout/card_delivery_type_checkout.dart';

class Check extends StatelessWidget {
  const Check({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController checkOutController = Get.put(CheckOutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: MaterialButton(
            color: AppColor.primaryColor,
            textColor: AppColor.white,
            onPressed: () {
              if(checkOutController.deliveryType == '0' && checkOutController.data.isEmpty ) {
                Get.snackbar('error', 'Please add shipping address');
              }
              else{
                checkOutController.checkout();
              }
            },
            child: const Text(
              'Checkout',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<CheckOutController>(
          builder: (controller) {
            return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  children: [
                    const Text(
                      'Choose Payment Method',
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                        onTap: () {
                          controller.choosePaymentMethod('0');
                        },
                        child: CardPaymentMethodCheckout(
                            text: 'Cash',
                            isActive: controller.paymentMethod == '0'
                                ? true
                                : false)),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                        onTap: () {
                          controller.choosePaymentMethod('1');
                        },
                        child: CardPaymentMethodCheckout(
                            text: 'Payment Cards',
                            isActive: controller.paymentMethod == '1'
                                ? true
                                : false)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Choose Delivery Type',
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              controller.chooseDeliveryType('0');
                            },
                            child: CardDeliveryTypeCheckout(
                              imagePath: AppImagePath.delivery,
                              title: "Delivery",
                              isActive: controller.deliveryType == '0'
                                  ? true
                                  : false,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              controller.chooseDeliveryType('1');
                            },
                            child: CardDeliveryTypeCheckout(
                              imagePath: AppImagePath.driveThru,
                              title: "Drive Thru",
                              isActive: controller.deliveryType == '1'
                                  ? true
                                  : false,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (controller.deliveryType == '0')
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Shipping Address',
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                            if(controller.data.isEmpty) InkWell(
                                onTap: (){
                                  Get.toNamed(AppRoute.addAddress);
                                },
                                child: Center(child: Text('Please add shipping address', style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold),),)),
                          ...List.generate(controller.data.length, (index){
                            return InkWell(
                              onTap: (){
                                controller.chooseShippingAddress('${controller.data[index].id}');
                              },
                              child: CardShippingAddressCheckout(
                                  title: '${controller.data[index].name}',
                                  subTitle: '${controller.data[index].city} ${controller.data[index].street}',
                                  isActive: controller.data[index].id.toString() == controller.addressId ? true:false),
                            );
                          })
                        ],
                      )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
