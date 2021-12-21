import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class PostService extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference postRef = FirebaseFirestore.instance.collection('posts');

  CollectionReference notificationRef =
      FirebaseFirestore.instance.collection('notifications');

  FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();

  UserDbController userDbController = Get.find<UserDbController>();

  var isUploading = false.obs;

  var isLiked = false.obs;

  // var isDisliked = false.obs;
  // var _dislikeCount = 0.obs;
  // Rx<int> get dislikeCount => _dislikeCount;

  var likeCount = 0.obs;

  List postList = [];

  var postCollection = [].obs;

  var userPostCount = 0.obs;

  Future<void> getUserPostCount(String userId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .doc(userId)
        .collection('userPosts')
        .get();

    userPostCount.value = querySnapshot.docs.length;
  }

  handleLikePost(
      {required String userId,
      required String postId,
      String? postImage}) async {
    bool _isLiked = false;

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(userId)
        .collection('userPosts')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.data()['likes'][auth.currentUser!.uid] == null) {
          _isLiked = false;
        } else {
          _isLiked = element.data()['likes'][auth.currentUser!.uid];
        }
      });
    });

    if (_isLiked) {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(userId)
          .collection("userPosts")
          .doc(postId)
          .update({
        'likes.${auth.currentUser!.uid}': false,
        'likeCount': likeCount.value <= 0 ? 0 : likeCount.value - 1
      });

      deleteLikeToNotificationFeed(postOwnerId: userId, postId: postId);

      isLiked.value = false;
      likeCount.value--;
    } else {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(userId)
          .collection("userPosts")
          .doc(postId)
          .update({
        'likes.${auth.currentUser!.uid}': true,
        'likeCount': likeCount.value + 1,
      });

      addLikeToNotificationFeed(
          postOwnerId: userId, postId: postId, postImage: postImage);

      isLiked.value = true;
      likeCount.value++;
    }
  }

  deleteLikeToNotificationFeed(
      {required String postOwnerId, required String postId}) async {
    bool isNotPostOwner = postOwnerId != userDbController.userData[0]['uid'];

    if (isNotPostOwner) {
      await notificationRef
          .doc(postOwnerId)
          .collection('notifications')
          .doc(postId)
          .get()
          .then((value) {
        if (value.exists) {
          value.reference.delete();
        }
      });
    }
  }

  addLikeToNotificationFeed(
      {required String postOwnerId,
      required String postId,
      String? postImage}) async {
    bool isNotPostOwner = userDbController.userData[0]['uid'] != postOwnerId;

    if (isNotPostOwner) {
      await notificationRef
          .doc(postOwnerId)
          .collection('notifications')
          .doc(postId)
          .set({
        'postId': postId,
        'postOwnerId': postOwnerId,
        'userId': auth.currentUser!.uid,
        'name': userDbController.userData[0]['name'],
        'userImage': userDbController.userData[0]['photoUrl'],
        'userName': userDbController.userData[0]['userName'],
        'type': 'like',
        'postImage': postImage,
        'timestamp': DateTime.now(),
      });
    }
  }

  var id = Uuid().v4();

  Future<void> uploadUserPost(dynamic posts) async {
    try {
      isUploading.value = true;
      await postRef
          .doc(auth.currentUser!.uid)
          .collection("userPosts")
          .doc(id)
          .set(posts.toJson());

      Get.snackbar(
        "Success!",
        "Data Uploaded!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Env.colors.primaryBlack,
        colorText: Colors.white,
        isDismissible: true,
      );
    } catch (e) {
      Get.snackbar(
        "Error!",
        "Please Try Again!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Env.colors.primaryBlack,
        colorText: Colors.white,
        isDismissible: true,
      );
    } finally {
      isUploading.value = false;
      id = Uuid().v4();
    }
  }
}
