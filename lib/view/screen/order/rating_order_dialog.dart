import 'package:ecommerce_app/controller/order/archive_order_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';



// show the dialog
void showDialogRating(BuildContext context, int orderId){
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      submitButtonText: 'Submit',
      submitButtonTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColor,
          fontSize: 18
      ),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => (),
      onSubmitted: (response) {
        ArchiveOrderController archiveOrderController = Get.find();
        archiveOrderController.submitRatingOrder(orderId, response.rating.toInt(), response.comment);

        // TODO: add your own logic
        // if (response.rating < 3.0) {
        //   // send their comments to your email or anywhere you wish
        //   // ask the user to contact you instead of leaving a bad review
        // } else {
        //   _rateAndReviewApp();
        // }
      },
    ),
  );
}