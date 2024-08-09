import 'package:ecommerce_app/core/class/crud.dart';
import 'package:get/get.dart';

import '../core/class/token.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(Token());
  }

}