import 'package:ecommerce_app/binding/init_binding.dart';
import 'package:ecommerce_app/core/localization/translation.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelang.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeLangController changeLangController = Get.put(ChangeLangController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: changeLangController.localLang,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: InitBinding(),
      theme: changeLangController.themeData,
      getPages: getPages,
    );
  }
}
