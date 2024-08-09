import 'dart:async';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? controller;
  Position? position;
  List<Marker> marker = [];
  CameraPosition? currentLocation;
  double? lat;
  double? long;

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    currentLocation = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 5,
    );
    addMarker(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  addMarker(LatLng position) {
    marker.clear();
    lat = position.latitude;
    long = position.longitude;
    marker.add(Marker(markerId: const MarkerId('1'), position: position));
    update();
  }

  goToCompleteAddAddressPage() {
    Get.toNamed(AppRoute.completeAddAddress, arguments: {
      'lat': lat,
      'long': long,
    });
  }

  @override
  void onInit() {
    controller = Completer<GoogleMapController>();
    getCurrentLocation();
    // TODO: implement onInit
    super.onInit();
  }
}
