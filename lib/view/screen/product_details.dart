import 'package:ecommerce_app/controller/product_details_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/prod/prod_price_and_quantity.dart';
import 'package:ecommerce_app/view/widget/prod/sub_items_list.dart';
import 'package:ecommerce_app/view/widget/prod/top_product_page_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp productController =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            height: 40,
            color: AppColor.secondColor,
            onPressed: () {
              Get.toNamed(AppRoute.cart);
            },
            child: const Text(
              'Go To Cart',
              style: TextStyle(color: AppColor.white),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    const TopProductPageDetails(),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${productController.itemModel.name}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 20, color: AppColor.fourthColor),
                          ),
                          ProdPriceAndQuantity(
                              onAdd: () {
                                productController.add();
                              },
                              onRemove: () {
                                productController.remove();
                              },
                              price: productController.itemModel.priceWithDiscount!,
                              count: productController.countCart),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${productController.itemModel.description}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Color',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 20, color: AppColor.fourthColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SubItemsList(),
                        ],
                      ),
                    )
                  ],
                ));
          },
        ));
  }
}
