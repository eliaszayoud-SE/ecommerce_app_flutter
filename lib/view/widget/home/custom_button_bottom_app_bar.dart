import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonBottomAppBar extends StatelessWidget {

  final String text;
  final IconData iconData;
  final void Function()? onPressed;
  final bool? active   ;
  const CustomButtonBottomAppBar({super.key, required this.text, required this.iconData, this.onPressed, this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed, child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, color: active==true ? AppColor.primaryColor:AppColor.grey2,),
        Text(text, style: TextStyle(color: active==true ? AppColor.primaryColor:AppColor.grey2),)
      ],
    ),);
  }
}
