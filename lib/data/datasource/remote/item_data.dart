import 'package:ecommerce_app/core/constant/link_api.dart';

import '../../../core/class/crud.dart';

class ItemData {
  Crud crud;
  ItemData(this.crud);

  getData(int categoryID, {Map<String, String>? headers}) async {
    var response = await crud.getData('${AppLink.items}?categoryId=$categoryID',
        headers: headers);
    return response.fold((l) => l, (r) => r);
  }
}
