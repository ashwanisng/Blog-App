// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  TextEditingController searchController = TextEditingController();

  UserDbController userDbController = Get.find<UserDbController>();

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
