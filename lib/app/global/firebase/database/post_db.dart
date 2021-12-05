import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/post/controllers/post_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostService extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference postRef = FirebaseFirestore.instance.collection('posts');

  List posts = [];

  var isUploading = false.obs;

  var isLiked = false.obs;

  var isDisliked = false.obs;
  Rx<int> _dislikeCount = 0.obs;
  Rx<int> get dislikeCount => _dislikeCount;

  Rx<int> _likes = 0.obs;
  Rx<int> get likes => _likes;

  void like() async {
    _likes.value++;
    QuerySnapshot querySnapshot = await postRef.get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.update({
        'likes': _likes.value,
      });
    }
  }

  void decreaseLike() async {
    _likes.value--;
    QuerySnapshot querySnapshot = await postRef.get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.update({
        'likes': _likes.value,
      });
    }
  }

  void disLikeCountIncrease() async {
    _dislikeCount.value++;
    QuerySnapshot querySnapshot = await postRef.get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.update({
        'dislikes': _dislikeCount.value,
      });
    }
  }

  void decreaseDisLikeCount() async {
    _dislikeCount.value--;
    QuerySnapshot querySnapshot = await postRef.get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.update({
        'dislikes': _dislikeCount.value,
      });
    }
  }

  Future<void> uploadUserPost(dynamic posts) async {
    try {
      isUploading.value = true;
      await postRef.add(posts.toJson());

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
    }
  }
}
