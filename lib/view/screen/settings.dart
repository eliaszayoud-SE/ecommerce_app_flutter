import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/settings_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {

    SettingsController controller = Get.put(SettingsController());

    return ListView(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: Get.width /3,
              color: AppColor.primaryColor,
            ),
            Positioned(
                top: Get.width / 4.5,
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColor.white,
                )),
          ],
        ),
        const SizedBox(
          height: 75,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            color: AppColor.white,
            child: Column(
              children: [
                const Divider(),
                ListTile(
                  onTap: (){
                    Get.toNamed(AppRoute.pendingOrder);
                  },
                  title: const Text('Order'),
                  trailing: const Icon(Icons.shopping_cart_outlined),
                ),
                const Divider(),
                ListTile(
                  onTap: (){
                    Get.toNamed(AppRoute.orderArchive);
                  },
                  title: const Text('Archive'),
                  trailing: const Icon(Icons.archive_outlined),
                ),
                const Divider(),
                ListTile(
                  onTap: (){
                    Get.toNamed(AppRoute.address);
                  },
                  title: const Text('Address'),
                  trailing: const Icon(Icons.location_history_outlined),
                ),

                const Divider(),
                ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse('tel:+2012121212'));
                  },
                  title: const Text('contact us'),
                  trailing: const Icon(Icons.phone_callback_outlined),
                ),
                const Divider(),
                ListTile(
                  onTap: (){
                    controller.logout();
                  },
                  title: const Text('Logout'),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
