import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';

class VerifyCodeData{
  Crud crud;
  VerifyCodeData(this.crud);
  
  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifyCode, {
      'email':email,
      'verify_code':verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
  
}