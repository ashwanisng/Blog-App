// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/auth/auth.dart';
import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserDbController userDbController = Get.find<UserDbController>();

  FirebaseAuthService authService = Get.find<FirebaseAuthService>();

  NetworkController networkController = Get.find<NetworkController>();

  FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();

  PostService postService = Get.find<PostService>();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() async {
    await userDbController.fetchAllUserDetails();
    await followerFollowingDb
        .getFollowersCountOfViewedUser(auth.currentUser!.uid);
    await followerFollowingDb
        .getFollowingCountOfViwedUser(auth.currentUser!.uid);

    await postService.getUserPostCount(auth.currentUser!.uid);
    super.onInit();
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
