import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class PostService extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference postRef = FirebaseFirestore.instance.collection('posts');

  FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();

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

  // updateLikeCount(String postId, int count) async {
  //   await FirebaseFirestore.instance
  //       .collection('posts')
  //       .doc(auth.currentUser!.uid)
  //       .collection('userPosts')
  //       .doc(postId)
  //       .update({'likeCount': count});
  // }

  handleLikePost({required String userId, required String postId}) async {
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

      isLiked.value = false;
      likeCount.value--;

      // updateLikeCount(postId, likeCount.value);
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

      isLiked.value = true;
      likeCount.value++;

      // updateLikeCount(postId, likeCount.value);
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
