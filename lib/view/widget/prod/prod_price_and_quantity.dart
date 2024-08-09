import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class ProdPriceAndQuantity extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final double price;
  final int count;
  const ProdPriceAndQuantity({super.key,required this.onAdd,required this.onRemove, required this.price, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 5),
                width: 50,
                // height: 30,
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.fourthColor)),
                child: Text(
                  '$count',
                  style: const TextStyle(fontSize: 20, height: 1.1),
                )),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          "$price \$",
          style: const TextStyle(
              color: AppColor.primaryColor, fontSize: 24, height: 1.1),
        )
      ],
    );
  }
}
