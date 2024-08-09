import 'package:ecommerce_app/core/class/crud.dart';

import '../../../core/constant/link_api.dart';

class AddressData{
  Crud crud;
  AddressData(this.crud);

  viewAddress(Map<String, String>? headers) async {
    var response =  await crud.getData(AppLink.viewAddress, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

  addAddress(String name, String city, String street, double lat, double long, String? phone, Map<String, String>? headers) async {
    var response = await crud.postData(AppLink.addAddress, {
      'lat':lat.toString(),
      'long':long.toString(),
      'name':name,
      'street':street,
      'city':city,
      'phone':phone
    }, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(int addressID, Map<String, String>? headers) async {
    var response = await crud.deleteData(AppLink.deleteAddress, {'address_id':addressID.toString()}, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

}