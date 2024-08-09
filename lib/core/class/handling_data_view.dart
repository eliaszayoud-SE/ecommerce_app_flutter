import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/image_path.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?  Center(child: Lottie.asset(AppImagePath.loading))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(child: Lottie.asset(AppImagePath.offline))
            : statusRequest == StatusRequest.failure
                ? Center(child: Lottie.asset(AppImagePath.noData))
                : statusRequest == StatusRequest.serverFailure
                    ? Center(child: Lottie.asset(AppImagePath.server))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {

    return statusRequest == StatusRequest.loading
        ?  Center(child: Lottie.asset(AppImagePath.loading))
        : statusRequest == StatusRequest.offlineFailure
        ? Center(child: Lottie.asset(AppImagePath.offline))
        : statusRequest == StatusRequest.serverFailure
        ? Center(child: Lottie.asset(AppImagePath.server))
        :statusRequest == StatusRequest.noData
        ? Center(child: Lottie.asset(AppImagePath.noData),)
        : widget;
  }
}