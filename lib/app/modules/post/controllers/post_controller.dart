// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/database/comment_db_controller.dart';
import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
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
  String? postOwnerId;
  String? postOwnerName;
  String? postOwnerPhotoUrl;
  String? postOwnerUsername;

  String? userImageUrl;

  NetworkController networkController = Get.find<NetworkController>();
  TextEditingController commentController = TextEditingController();
  CommentDbController commentDbController = Get.find<CommentDbController>();
  UserDbController userDbController = Get.find<UserDbController>();
  FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();

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
      bool isNotPostOwner = postOwnerId != userDbController.userData[0]['uid'];

      if (isNotPostOwner) {
        await FirebaseFirestore.instance
            .collection('notifications')
            .doc(postOwnerId!)
            .collection("notifications")
            .add({
          "postId": postId,
          "userId": userId,
          "userName": userName,
          "userImage": userImageUrl,
          "commentData": commentController.text,
          "type": "comment",
          'postImage': postUrl,
          'timestamp': DateTime.now(),
        });
      }
    }

    commentController.clear();
  }

  @override
  void onInit() {
    super.onInit();

    dynamic data = Get.arguments;

    caption = data['captions'];
    date = (DateTime.parse(data["createdAt"].toDate().toString()));
    userName = data['userName'];
    userId = data['userId'];
    postId = data['postId'];
    userImageUrl = data['imageUrl'];
    postUrl = data['postUrl'];
    postOwnerId = data['postOwnerId'];
    postOwnerName = data['postOwnerName'];
    postOwnerPhotoUrl = data['postOwnerImageUrl'];
    postOwnerUsername = data['postOwnerUsername'];

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
