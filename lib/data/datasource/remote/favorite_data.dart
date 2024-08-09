import 'package:ecommerce_app/core/constant/link_api.dart';

import '../../../core/class/crud.dart';

class FavoriteData{
  Crud curd;
  FavoriteData(this.curd);

  addToFavorite(String productId, Map<String, String>? headers) async {
    var response = await curd.postData(AppLink.addFavorite, {'product_id':productId}, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

  deleteFromFavorite(String productId, Map<String, String>? headers) async {
    var response = await curd.deleteData(AppLink.deleteFavorite, {'product_id':productId}, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

}