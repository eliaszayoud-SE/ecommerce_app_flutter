import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/view_address_controller.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addAddress);
        },
        child: const Icon(Icons.add_outlined),
      ),
      appBar: AppBar(
        title: const Text('Address'),
      ),
      body: GetBuilder<ViewAddressController>(
        builder: (controller) {
          return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CardAddress(addressModel: controller.data[index], onDelete: (){
                      controller.deleteAddress(controller.data[index].id!);
                    },);
                  }));
        },
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({super.key, required this.addressModel, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColor.white,
        child: Container(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(addressModel.name!),
        subtitle: Text('${addressModel.city}, ${addressModel.street}'),
        trailing: IconButton(icon: const Icon(Icons.delete_outline_outlined), onPressed: onDelete,),
      ),
    ));
  }
}
