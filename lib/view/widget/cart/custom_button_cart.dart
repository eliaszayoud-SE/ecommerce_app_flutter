
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonCart extends StatelessWidget {
  final String textButton;
  final Function()? onPressed;
  const CustomButtonCart({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: MaterialButton(
        textColor: AppColor.white,
        color: AppColor.primaryColor,
        onPressed: onPressed,
        child: Text(textButton, style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}