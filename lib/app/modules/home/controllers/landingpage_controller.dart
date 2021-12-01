// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class LandingPageController extends GetxController {
  RxInt slectedIndex = 0.obs;

  void changeIndex(int index) {
    slectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
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
