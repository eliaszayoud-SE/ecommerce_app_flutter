import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class TokenData {
  Crud crud;
  TokenData(this.crud);

  getAccessToken(Map<dynamic, dynamic>? data) async {
    var response = await crud.postData(AppLink.refresh,data!);
    return response.fold((l) => l, (r) => r);
  }

  getToken(String email, String password) async {
    var response = await crud.postData(AppLink.signIn, {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
