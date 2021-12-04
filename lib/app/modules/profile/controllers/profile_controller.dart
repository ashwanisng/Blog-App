// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/global/firebase/auth/auth.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserDbController userDbController = Get.find<UserDbController>();

  FirebaseAuthService authService = Get.find<FirebaseAuthService>();

  @override
  void onInit() {
    userDbController.fetchAllUserDetails();
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
