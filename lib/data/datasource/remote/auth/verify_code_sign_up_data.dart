import '../../../../core/class/crud.dart';
import '../../../../core/constant/link_api.dart';

class VerifyCodeSignUpData {
  Crud crud;

  VerifyCodeSignUpData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifyCodeSignUp, {
      'email':email,
      'verify_code':verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}