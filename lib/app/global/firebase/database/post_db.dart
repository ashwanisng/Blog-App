import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostService extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference postRef = FirebaseFirestore.instance.collection('posts');

  List posts = [];

  Future<void> uploadUserPost(dynamic posts) async {
    try {
      await postRef
          .doc(auth.currentUser!.uid)
          .collection("posts")
          .add(posts.toJson());

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
      print(e);
    }
  }
}
/**
 * {
    required String postId,
    required String userId,
    required String username,
    required String title,
    required String description,
    required String content,
    required int likes,
    required int disLikes,
  }
 */