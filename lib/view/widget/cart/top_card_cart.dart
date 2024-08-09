import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  final String message;
  const TopCardCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: AppColor.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(message, style: const TextStyle(
          color: AppColor.white
      ),), );
  }
}
