import 'package:ecommerce_app/core/constant/link_api.dart';

import '../../../../core/class/crud.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postData(String username, String email, String password, String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      'username':username,
      'email':email,
      'password':password,
      'phone':phone
    });
    return response.fold((l) => l, (r) => r);
  }
}
