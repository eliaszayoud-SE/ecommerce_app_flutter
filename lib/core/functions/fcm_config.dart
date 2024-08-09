

import 'package:ecommerce_app/controller/order/bending_order_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

fcmConfig(){
  
  FirebaseMessaging.onMessage.listen((message){
    FlutterRingtonePlayer().playNotification();
    Get.snackbar('Notification', 'You get new Notification');
    refreshNotificationPage(message.data);
  });
  
}

refreshNotificationPage(data){
  if(Get.currentRoute == '/pendingOrder' && data['pagename'] == 'refreshorderpending'){
    BendingOrderController bendingOrderController = Get.find();
    bendingOrderController.refreshPage();
  }
}