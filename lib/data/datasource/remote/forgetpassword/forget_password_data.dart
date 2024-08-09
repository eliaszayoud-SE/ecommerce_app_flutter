import 'package:ecommerce_app/core/constant/link_api.dart';

import '../../../../core/class/crud.dart';

class ForgetPasswordData{
  
  Crud crud;
  ForgetPasswordData(this.crud);
  
  postData(String email) async {
    var response = await crud.postData(AppLink.forgetPassword, {
      'email':email,
    });
    return response.fold((l) => l, (r) => r);
  }
  
}