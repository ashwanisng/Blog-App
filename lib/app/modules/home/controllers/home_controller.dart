// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserDbController userDb = Get.find<UserDbController>();

  PostService postService = Get.find<PostService>();

  FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();

  NetworkController networkController = Get.find<NetworkController>();

  RxList finalPosts = [].obs;

  @override
  void onInit() {
    followerFollowingDb.getListOfUserFollowing();
    super.onInit();

    userDb.fetchAllUserDetails();
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
