import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isActive;
  const CardDeliveryTypeCheckout({super.key, required this.imagePath, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 120,
      height: 130,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor),
          color:isActive ? AppColor.primaryColor:null
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 80,color: isActive ? AppColor.white:null,),
          Text(title, style: TextStyle(
            color:  isActive ? AppColor.white:AppColor.secondColor,
          ),),
        ],
      ),
    );
  }
}
