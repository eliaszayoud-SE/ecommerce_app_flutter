import 'package:ecommerce_app/controller/order/order_details_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: GetBuilder<OrderDetailsController>(
          builder: (controller){
            return HandlingDataRequest(statusRequest: controller.statusRequest, widget: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            const TableRow(
                              children: [
                                Text(
                                  'Item',
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'QTY',
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),

                            ...List.generate(controller.data.length, (index){
                              return TableRow(
                                children: [
                                  Text(
                                    '${controller.data[index]['product']['name']}',
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '${controller.data[index]['qty']}',
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '${controller.data[index]['unit_price']}',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              );
                            } ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Price : ${controller.orderModel.totalPrice} \$',
                            style: const TextStyle(
                                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

              if(controller.orderModel.address != null) Column(
                 children: [
                   const Card(child: ListTile(
                     title: Text('shipping Address', style: TextStyle(
                         color: AppColor.primaryColor, fontWeight: FontWeight.bold),),
                     subtitle: Text('Damascus Street one'),
                   ),),
                   const SizedBox(height: 10,),
                   Container(
                       padding: const EdgeInsets.symmetric(horizontal: 10),
                       height: 300,
                       width: double.infinity,
                       child :GoogleMap(
                         mapType: MapType.normal,
                         initialCameraPosition: controller.cameraPosition!,
                         markers: controller.marker.toSet(),

                         onMapCreated: (GoogleMapController googleMapController) {
                           controller.completerController!.complete(googleMapController);
                         },
                       )
                   )
                 ],
               )
              ],
            ),);
          },
        )
      ),
    );
  }
}
