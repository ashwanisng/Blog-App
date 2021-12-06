import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostService extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference postRef = FirebaseFirestore.instance.collection('posts');

  FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();

  var isUploading = false.obs;

  var isLiked = false.obs;

  var isDisliked = false.obs;
  Rx<int> _dislikeCount = 0.obs;
  Rx<int> get dislikeCount => _dislikeCount;

  Rx<int> _likes = 0.obs;
  Rx<int> get likes => _likes;

  List postList = [];

  var postCollection = [].obs;

  void like() async {
    _likes.value++;
    QuerySnapshot querySnapshot =
        await postRef.doc(auth.currentUser!.uid).collection("userPosts").get();

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
      await postRef
          .doc(auth.currentUser!.uid)
          .collection("userPosts")
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
    } finally {
      isUploading.value = false;
    }
  }

  getUserPosts() async {
    try {
      for (var i = 0; i < followerFollowingDb.followingList.length; i++) {
        // var snapshot = await FirebaseFirestore.instance
        //     .collection('posts')
        //     .doc(followingList[i])
        //     .collection("userPosts")
        //     .orderBy('createdAt', descending: true)
        //     .get();

        print(followerFollowingDb.followingList[i]);

        // postList += snapshot.docs.map((e) => (e.data())).toList();
      }

      postCollection.value = postList;

      // print('${followerFollowingDb.followingList.length} following list');
    } catch (e) {
      print(e);
    }
  }
}
