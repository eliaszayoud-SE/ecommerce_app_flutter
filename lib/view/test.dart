import 'package:ecommerce_app/core/functions/check_internet.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}



class _TestState extends State<Test> {
  initData() async {
    await checkInternet();
  }

  @override
  void initState() {
     initData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}
