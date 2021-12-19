// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/auth/auth.dart';
import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserDbController userDbController = Get.find<UserDbController>();

  FirebaseAuthService authService = Get.find<FirebaseAuthService>();

  NetworkController networkController = Get.find<NetworkController>();

  FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();

  PostService postService = Get.find<PostService>();

  @override
  void onInit() {
    userDbController.fetchAllUserDetails();

    followerFollowingDb
        .getFollowersCountOfViewedUser(userDbController.userData[0]['uid']);
    followerFollowingDb
        .getFollowingCountOfViwedUser(userDbController.userData[0]['uid']);

    postService.getUserPostCount(userDbController.userData[0]['uid']);
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
