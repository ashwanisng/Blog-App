// ignore_for_file: unnecessary_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  String? title;
  String? body;
  DateTime? date;

  @override
  void onInit() {
    super.onInit();

    dynamic data = Get.arguments;

    title = data['title'];
    body = data['content'];
    date = (data["createdAt"] as Timestamp).toDate();
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
