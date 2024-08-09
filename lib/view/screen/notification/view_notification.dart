import 'package:ecommerce_app/controller/notification/view_notification_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class ViewNotification extends StatelessWidget {
  const ViewNotification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewNotificationController());
    return Scaffold(

      body: GetBuilder<ViewNotificationController>(
        builder: (controller){
          return HandlingDataRequest(statusRequest: controller.statusRequest, widget: Container(
            margin: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const Center(child:  Text('Notification', style: TextStyle(
                    fontSize: 18,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold
                ),),),
                  const SizedBox(height: 30,),
                ...List.generate(controller.data.length, (index) =>
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Stack(
                        children: [
                          ListTile(
                            title: Text(controller.data[index]['title']),
                            subtitle: Text(controller.data[index]['body']),

                          ),
                          Positioned(
                              right: 0,
                              top: 3,
                              child:Text(Jiffy.parse(controller.data[index]['date_time']).fromNow(), style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                                fontSize: 18
                          ),))
                        ],
                      ),)
                )

              ],
            ),
          ));
        },
      ),

    );
  }
}


