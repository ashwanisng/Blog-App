import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDb extends GetxController {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> uploadUserData(dynamic user) async {
    try {
      await userCollection
          .doc(auth.currentUser!.uid)
          .collection("users")
          .add(user.toJson());

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
    }
  }
}
