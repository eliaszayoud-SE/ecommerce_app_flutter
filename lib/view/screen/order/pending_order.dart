import 'package:ecommerce_app/controller/order/bending_order_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class PendingOrder extends StatelessWidget {
  const PendingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BendingOrderController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: GetBuilder<BendingOrderController>(
          builder: (controller){
            return HandlingDataRequest(statusRequest: controller.statusRequest, widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index){
                  return CardOrderList(orderModel: controller.data[index],);
                }));
          },
        ),
        ),

    );
  }
}


class CardOrderList extends GetView<BendingOrderController> {
  final OrderModel orderModel;
  const CardOrderList({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Card(child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Order Number : #${orderModel.id}", style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold
              ),),
              const Spacer(),
              Text(Jiffy.parse(orderModel.dateTime!).fromNow(), style: const TextStyle(
                color: AppColor.primaryColor,

              ),),
            ],
          ),
          const Divider(),
          Text("Order Type : ${controller.printOrderType(orderModel.type!)}"),
          Text("Order Price : ${orderModel.price} \$"),
          Text("Delivery Price : ${orderModel.priceDelivery} \$"),
          Text("Payment Method : ${controller.printPaymentType(orderModel.paymentType!)}"),
          Text("Order Status : ${controller.printOrderStatus(orderModel.status!)}"),
          const Divider(),
          Row(
            children: [
              Text('Total Price : ${orderModel.totalPrice} \$', style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold
              ),),
              const Spacer(),
              MaterialButton(onPressed: (){
                Get.toNamed(AppRoute.orderDetails, arguments: {
                  'orderModel':orderModel
                });
              }, color: AppColor.thirdColor, textColor: AppColor.secondColor,child: const Text('Detail', style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),),
             const SizedBox(width: 5,),
              if(orderModel.status == 0) MaterialButton(onPressed: (){
                  controller.deleteOrder(orderModel.id.toString());
              }, color: AppColor.thirdColor, textColor: AppColor.secondColor,child: const Text('Delete', style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),)
            ],
          )

        ],
      ),
    ));
  }
}
