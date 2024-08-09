import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomCardHome extends StatelessWidget {
  final String? title;
  final String? body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: [Container(
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          height: 160,
          alignment: Alignment.center,
          child:  ListTile(
            title: Text(title!,
                style: const TextStyle(
                    color: Colors.white, fontSize: 20)),
            subtitle: Text(body!,
                style: const TextStyle(
                    color: Colors.white, fontSize: 30)),
          ),
        ),
          Positioned(
              top: -10,
              right: -40,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    color: AppColor.secondColor,
                    borderRadius: BorderRadius.circular(160)),
              ))
        ],
      ),
    );
  }
}
