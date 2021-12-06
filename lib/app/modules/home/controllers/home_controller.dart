// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserDbController userDb = Get.find<UserDbController>();

  PostService postService = Get.find<PostService>();

  // FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();

  RxList finalPosts = [].obs;

  collectFinalPostList() {
    print('${postService.followingList.length} following list');
  }

  @override
  void onInit() {
    postService.getListOfUserFollowing();
    // collectFinalPostList();
    super.onInit();

    userDb.fetchAllUserDetails();
    postService.getUserPosts();

    // followerFollowingDb.getListOfUserFollowing();

    // print(finalPosts.length);

    // print('${finalPosts.length} --- ye following list ki length hai');
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
