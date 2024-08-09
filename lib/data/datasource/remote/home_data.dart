import '../../../core/class/crud.dart';
import '../../../core/constant/link_api.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData(Map<String, String>? headers) async {
    var response =  await crud.getData(AppLink.homeData, headers: headers);
    return response.fold((l) => l, (r) => r);
  }

  search(Map<String, String>? headers, String search) async {
    var response =  await crud.getData("${AppLink.search}?search=$search", headers: headers);
    return response.fold((l) => l, (r) => r);
  }

}