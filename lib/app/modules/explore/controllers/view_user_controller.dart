// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class ViewUserController extends GetxController {
  //TODO: Implement ExploreController

  String? bio;
  String? name;
  String? image;

  @override
  void onInit() {
    super.onInit();

    dynamic data = Get.arguments;

    name = data['name'];
    bio = data['bio'];
    image = data['image'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
