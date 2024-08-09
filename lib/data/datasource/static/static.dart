import 'package:ecommerce_app/core/constant/image_path.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../model/on_boarding_model.dart';

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
      title: "2".tr, body: "3".tr, imagePath: AppImagePath.onBoardingImageOne),
  OnBoardingModel(
      title: "4".tr, body: "5".tr, imagePath: AppImagePath.onBoardingImageTow),
  OnBoardingModel(
      title: "6".tr, body: "7".tr, imagePath: AppImagePath.onBoardingImageThree),
  // OnBoardingModel(
  //     title: "Fast Delivery",
  //     body:
  //         "We Have a 100k Product , Choose \n Your Product From Our E-commerce Shop",
  //     image: AppImageAsset.onBoardingImageFour),
];