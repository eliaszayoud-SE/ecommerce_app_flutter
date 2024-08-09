import 'package:ecommerce_app/core/constant/link_api.dart';

import '../../../core/class/crud.dart';

class UserData {
  Crud crud;
  UserData(this.crud);

  getData(Map<String, String>? headers) async {
    var response = await crud.getData(AppLink.userData, headers: headers);
    return response.fold((l) => l, (r) => r);
  }
}
