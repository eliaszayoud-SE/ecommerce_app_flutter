import 'package:ecommerce_app/core/constant/link_api.dart';

import '../../../core/class/crud.dart';

class CheckoutData {

  Crud crud;

  CheckoutData(this.crud);

  checkout(Map data, Map<String, String>? headers) async {
    var response = await crud.postData(AppLink.checkout, data, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

}