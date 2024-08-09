import 'package:ecommerce_app/core/constant/link_api.dart';
import '../../../../core/class/crud.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.signIn, {
      'email':email,
      'password':password
    });

    return response.fold((l) => l, (r) => r);

  }

  getUserInfo(Map<String, String>? headers) async {
    var response = await crud.getData(AppLink.userData, headers: headers);
    return response.fold((l) => l, (r) => r);
  }


}