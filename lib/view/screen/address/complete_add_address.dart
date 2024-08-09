import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/widget/auth/custom_material_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/complete_add_controller.dart';
import '../../../core/functions/valid_input.dart';
import '../../../core/shared/custom_text_form_field.dart';

class CompleteAddAddress extends StatelessWidget {
  const CompleteAddAddress({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(CompleteAddController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add detail address'),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<CompleteAddController>(
            builder: (controller){
              return HandlingDataRequest(statusRequest: controller.statusRequest, widget:  ListView(
                    children: [
                      CustomTextFormField(
                          validator: (value) {
                            return validInput(value!,2,50,null);
                          },
                          isNumber: false,
                          textEditingController:
                          controller.name,
                          hintText: 'name',
                          labelText: 'name',
                          iconData: Icons.home_outlined),
                      CustomTextFormField(
                          validator: (value) {
                            return validInput(value!,2,50,null);
                          },
                          isNumber: false,
                          textEditingController:
                          controller.city,
                          hintText: 'City',
                          labelText: 'City',
                          iconData: Icons.location_city_outlined),
                      CustomTextFormField(
                          validator: (value) {
                            return validInput(value!,2,50,null);
                          },
                          isNumber: false,
                          textEditingController:
                          controller.street,
                          hintText: 'Street',
                          labelText: 'Street',
                          iconData: Icons.streetview_outlined),
                      CustomTextFormField(
                          validator: (value) {
                            return validInput(value!,9,10,'phone');
                          },
                          isNumber: false,
                          textEditingController:
                          controller.phone,
                          hintText: 'Phone',
                          labelText: 'Phone',
                          iconData: Icons.phone_outlined),
                      CustomMaterialButtonAuth(text: 'Add', onPressed: (){
                        controller.addData();
                      },)
                    ],
                  ));
            },
          ),
        ));
  }
}
