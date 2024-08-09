import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address/add_controller.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    AddressController addressController = Get.put(AddressController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Location'),
        ),
        body: GetBuilder<AddressController>(
          builder: (controller) {
            return HandlingDataRequest(
                statusRequest: addressController.statusRequest,
                widget: Stack(alignment: Alignment.center, children: [
                  Column(
                    children: [
                      if (addressController.position != null)
                        Expanded(
                            child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: addressController.currentLocation!,
                          markers: addressController.marker.toSet(),
                          onTap: (latLng) {
                            addressController.addMarker(latLng);
                          },
                          onMapCreated: (GoogleMapController controller) {
                            addressController.controller!.complete(controller);
                          },
                        )),
                    ],
                  ),
                  Positioned(
                      bottom: 10,
                      child: MaterialButton(
                        minWidth: 250,
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          addressController.goToCompleteAddAddressPage();
                        },
                        color: AppColor.primaryColor,
                        child: const Text(
                          'Complete address info',
                          style: TextStyle(color: AppColor.white, fontSize: 18),
                        ),
                      ))
                ]));
          },
        ));
  }
}
