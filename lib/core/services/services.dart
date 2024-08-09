import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{

  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "",
          appId: "1:684458280795:android:1b4ba82d1f4487b53dfc7e",
          messagingSenderId: "684458280795",
          projectId: "ecommerce-31838",
          storageBucket: "ecommerce-31838.appspot.com",
        ));
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

}

initialServices() async {
  await Get.putAsync( () => MyServices().init());
}
