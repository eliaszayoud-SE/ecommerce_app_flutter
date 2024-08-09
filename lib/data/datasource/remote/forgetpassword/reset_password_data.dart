import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class ResetPasswordData{
  Crud crud;
  ResetPasswordData(this.crud);

  postData(String email, String verifyCode, String password) async {
    var response = await crud.postData(AppLink.resetPassword, {
      'email':email,
      'verify_code':verifyCode,
      'password':password
    });
    return response.fold((l) => l, (r) => r);
  }

}