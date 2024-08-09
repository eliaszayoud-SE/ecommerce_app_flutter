import '../../../core/class/crud.dart';
import '../../../core/constant/link_api.dart';

class CartData{

  Crud crud;
  CartData(this.crud);

  addToCart(String productId, Map<String, String>? headers) async {
    var response = await crud.postData(AppLink.addToCart, {'product_id':productId}, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

  deleteFromCart(String productId, Map<String, String>? headers) async {
    var response = await crud.deleteData(AppLink.deleteFromCart, {'product_id':productId}, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

  getCount(String productId, Map<String, String>? headers) async {
    var response = await crud.getData('${AppLink.itemCount}?productId=$productId', headers: headers);
    return response.fold((l) => l, (r) => r);
  }

  viewCart(Map<String, String>? headers) async {
    var response = await crud.getData(AppLink.viewCart, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName ,Map<String, String>? headers) async {
    var response = await crud.getData('${AppLink.checkCoupon}?coupon_name=$couponName' ,headers: headers);
    return response.fold((l) => l, (r) => r);
  }


}