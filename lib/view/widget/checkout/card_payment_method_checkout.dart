import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String text;
  final bool isActive;
  const CardPaymentMethodCheckout({super.key, required this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color:  isActive ? AppColor.primaryColor:AppColor.thirdColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: TextStyle(color: isActive ?AppColor.white:AppColor.primaryColor),
      ),
    );
  }
}
