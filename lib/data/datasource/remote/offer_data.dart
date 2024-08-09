import '../../../core/class/crud.dart';
import '../../../core/constant/link_api.dart';

class OfferData{
  Crud crud;
  OfferData(this.crud);

  getOffersItem(Map<String, String>? headers) async {
    var response = await crud.getData(AppLink.offersItem, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

}