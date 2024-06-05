import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/theme_Colors.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    var kHeight = MediaQuery.of(context).size.height / 100;
    var kWidth = MediaQuery.of(context).size.width / 100;

    return Scaffold(
        backgroundColor: kc.scaffoldColor,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "evaly",
            style: TextStyle(
                fontFamily: "Genos",
                color: kc.primaryTextColor,
                fontSize: kWidth * 25,
                fontWeight: FontWeight.bold),
          ),

        ])));
  }
}
