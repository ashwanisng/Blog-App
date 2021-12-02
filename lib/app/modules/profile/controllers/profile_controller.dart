// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/global/firebase/database/user_db.dart';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString userName = ''.obs;
  RxString name = ''.obs;
  RxString photoUrl = ''.obs;

  UserDbController userDbController = Get.find<UserDbController>();

  getData() {
    userName.value = userDbController.userData[0]['userName'];
    name.value = userDbController.userData[0]['name'];
    photoUrl.value = userDbController.userData[0]['photoUrl'];
  }

  @override
  void onInit() {
    userDbController.fetchUserData();

    super.onInit();

    getData();
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
