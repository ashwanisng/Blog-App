import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/data/model/user.dart';
import 'package:blog_app/app/modules/explore/views/components/search_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDbController extends GetxController {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  FirebaseAuth auth = FirebaseAuth.instance;
  var userData = [].obs;

  late Future<QuerySnapshot> searchResult;

  String? name;

  Future<void> uploadUserData(dynamic user) async {
    try {
      await userCollection.add(user.toJson());

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

  fetchUserData() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection("users")
          .get();

      userData.value = snapshot.docs.map((e) => (e.data())).toList();

      update();
    } catch (e) {
      // print(e);/
    }
  }

  var searchResultList = [].obs;

  Future<void> searchUser(String query) async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("users")
          .where("userName", isGreaterThanOrEqualTo: query)
          .get();

      searchResultList.value = snapshot.docs.map((e) => (e.data())).toList();
    } catch (e) {
      print(e);
    }
  }
}
