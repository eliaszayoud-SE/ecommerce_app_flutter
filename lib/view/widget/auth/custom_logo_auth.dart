import 'package:ecommerce_app/core/constant/image_path.dart';
import 'package:flutter/material.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImagePath.logo,
      height: 170,
    );
  }
}
