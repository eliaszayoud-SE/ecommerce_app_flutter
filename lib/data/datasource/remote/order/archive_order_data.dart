import '../../../../core/class/crud.dart';
import '../../../../core/constant/link_api.dart';

class ArchiveOrderData{
  Crud crud;
  ArchiveOrderData(this.crud);

  getArchiveOrder(Map<String, String>? headers) async {
    var response =  await crud.getData(AppLink.archiveOrder, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

  addRating(String orderId, String rating, String note ,Map<String, String>? headers) async {
    var response = await crud.postData(AppLink.addRatingOrder, {
      'order_id':orderId,
      'rating':rating,
      'note':note
    }, headers: headers);
    return response.fold((l) => l, (r) => r);
  }



}