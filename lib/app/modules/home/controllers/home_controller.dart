// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserDbController userDb = Get.find<UserDbController>();
  @override
  void onInit() {
    super.onInit();

    userDb.fetchUserData();
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
