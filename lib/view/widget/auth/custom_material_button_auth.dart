import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomMaterialButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomMaterialButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        color: AppColor.primaryColor,
          textColor: AppColor.white,
          onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
