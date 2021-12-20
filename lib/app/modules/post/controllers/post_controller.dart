// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/database/comment_db_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  String? caption;
  DateTime? date;
  String? userName;
  String? userId;
  String? postId;
  String? postUrl;

  String? userImageUrl;

  NetworkController networkController = Get.find<NetworkController>();
  TextEditingController commentController = TextEditingController();
  CommentDbController commentDbController = Get.find<CommentDbController>();

  uploadComment() async {
    if (commentController.text.isNotEmpty) {
      commentDbController.addComment(
        comment: commentController.text,
        postId: postId!,
        userId: userId!,
        userName: userName!,
        dateTime: DateTime.now(),
        userImageUrl: userImageUrl!,
      );
    }
    commentController.clear();
  }

  @override
  void onInit() {
    super.onInit();

    dynamic data = Get.arguments;

    caption = data['captions'];
    date = (data["createdAt"] as Timestamp).toDate();
    userName = data['userName'];
    userId = data['userId'];
    postId = data['postId'];
    userImageUrl = data['imageUrl'];
    postUrl = data['postUrl'];

    uploadComment();
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
