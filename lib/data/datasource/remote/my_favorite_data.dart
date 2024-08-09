import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class MyFavoriteData{
  Crud crud;
  MyFavoriteData(this.crud);

  getData(Map<String, String>? headers) async {
    var response = await crud.getData(AppLink.listFavorite, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

  deleteFromFavorite(String productId, Map<String, String>? headers) async {
    var response = await crud.deleteData(AppLink.deleteFavorite, {'product_id':productId}, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

}