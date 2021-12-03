import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/app/modules/home/views/home_view.dart';
import 'package:blog_app/app/modules/register/views/register_view.dart';
import 'package:get/get.dart';

import 'package:blog_app/app/modules/entry/controllers/entry_controller.dart';
import 'package:get_storage/get_storage.dart';

class EntryView extends GetView<EntryController> {
  final userData = GetStorage();

  void checkIfLoggedInOrNot() {
    if (userData.read("isLoggedIn") == true) {
      Get.offAll(() => HomeView());
    } else {
      Get.offAll(() => const RegisterView());
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      checkIfLoggedInOrNot();
    });

    return Scaffold(
      backgroundColor: Env.colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            FlutterLogo(
              size: 80,
              textColor: Colors.blue,
              // style: FlutterLogoStyle.horizontal,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
