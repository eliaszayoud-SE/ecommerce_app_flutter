import '../../../../core/class/crud.dart';
import '../../../../core/constant/link_api.dart';

class BendingOrderData{
  Crud crud;
  BendingOrderData(this.crud);

  getBendingOrder(Map<String, String>? headers) async {
    var response =  await crud.getData(AppLink.bendingOrder, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(String orderID, Map<String, String>? headers) async {
    var response = await crud.deleteData(AppLink.deleteOrder, {'order_id':orderID}, headers: headers);
    return response.fold((l) => l, (r) => r);
  }


}