// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/model/user.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString userName = ''.obs;
  RxString name = ''.obs;
  RxString photoUrl = ''.obs;

  // UserDbController userDbController = Get.find<UserDbController>();
  List userData = <UserModel>[];
  FirebaseAuth auth = FirebaseAuth.instance;

  fetchUserData() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection("users")
          .get();

      userData = snapshot.docs.map((e) => (e.data())).toList();

      print(userData[0]['name']);
      userName.value = userData[0]['userName'];
      name.value = userData[0]['name'];
      photoUrl.value = userData[0]['photoUrl'];

      update();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    fetchUserData();
    super.onInit();

    // for (var i = 0; i < userDb.userData.length; i++) {
    //   name = userDb.userData[i]['name'];
    //   userName = userDb.userData[i]['userName'];
    //   photoUrl = userDb.userData[i]['photoUrl'];
    // }
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
