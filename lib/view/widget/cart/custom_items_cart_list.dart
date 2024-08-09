import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/image_path.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final double price;
  final int count;
  final String imagePath;
  final bool discount;
  final void Function()? onPressedAdd;
  final void Function()? onPressedDelete;
  const CustomItemsCartList(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagePath,
      required this.onPressedAdd,
      required this.onPressedDelete,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    height: 90,
                  )),
              Expanded(
                  flex: 4,
                  child: ListTile(
                    title: Text(
                      name,
                      style: const TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      '$price \$',
                      style: const TextStyle(
                          color: AppColor.primaryColor, fontFamily: 'sans'),
                    ),
                  )),
              Expanded(
                  child: Column(
                children: [
                  SizedBox(
                      height: 40,
                      child: IconButton(
                          onPressed: onPressedAdd, icon: const Icon(Icons.add))),
                  SizedBox(
                    height: 25,
                    child: Text('$count', style: const TextStyle(fontFamily: 'sans')),
                  ),
                  SizedBox(
                      height: 33,
                      child: IconButton(
                          onPressed: onPressedDelete,
                          icon: const Icon(Icons.remove))),
                ],
              ))
            ],
          ),
          if (discount) Image.asset(AppImagePath.sale, width: 40,)
        ],
      ),
    );
  }
}
