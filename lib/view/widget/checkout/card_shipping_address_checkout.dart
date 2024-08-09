import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CardShippingAddressCheckout extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isActive;
  const CardShippingAddressCheckout({super.key, required this.title, required this.subTitle, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: isActive ? AppColor.primaryColor:null,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(
        title: Text(title, style: TextStyle(
            fontWeight: FontWeight.bold,
            color:isActive ? AppColor.white:null
        ),),
        subtitle: Text(subTitle,  style: TextStyle(
            fontWeight: FontWeight.bold,
            color:isActive ? AppColor.white:null
        )),
      ),
    );
  }
}
