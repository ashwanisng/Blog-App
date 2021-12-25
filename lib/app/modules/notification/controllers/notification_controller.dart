// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

  NetworkController networkController = Get.find<NetworkController>();
  UserDbController userDb = Get.find<UserDbController>();

  getNotificationFeed() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('notifications')
        .doc(userDb.userData[0]['uid'])
        .collection("notifications")
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs.length;
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
