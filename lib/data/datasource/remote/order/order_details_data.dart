import '../../../../core/class/crud.dart';
import '../../../../core/constant/link_api.dart';

class OrderDetailsData{
  Crud crud;
  OrderDetailsData(this.crud);

  getOrderDetails(String orderId,Map<String, String>? headers) async {
    var response =  await crud.getData('${AppLink.orderDetails}?order_id=$orderId', headers: headers);
    return response.fold((l) => l, (r) => r);
  }



}