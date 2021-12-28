// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:blog_app/app/modules/post/controllers/post_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

  NetworkController networkController = Get.find<NetworkController>();
  UserDbController userDb = Get.find<UserDbController>();
  PostService postService = Get.find<PostService>();

  @override
  void onInit() {
    // await postService.getNotificationFeed();
    print(postService.isEmpty.value);
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
