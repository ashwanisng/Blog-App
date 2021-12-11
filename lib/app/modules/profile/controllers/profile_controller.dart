// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/auth/auth.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserDbController userDbController = Get.find<UserDbController>();

  FirebaseAuthService authService = Get.find<FirebaseAuthService>();

  NetworkController networkController = Get.find<NetworkController>();

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
