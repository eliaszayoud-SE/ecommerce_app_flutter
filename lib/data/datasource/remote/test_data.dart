
import 'package:ecommerce_app/core/constant/link_api.dart';

import '../../../core/class/crud.dart';

class TestData{
  Crud crud;

  TestData(this.crud);

  getDate() async {
   var response =  await crud.postData(AppLink.signUp, {

   });
    return response.fold((l) => l, (r) => r);
  }


}