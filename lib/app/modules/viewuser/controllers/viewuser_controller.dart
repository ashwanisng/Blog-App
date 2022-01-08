// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:get/get.dart';

class ViewuserController extends GetxController {
  FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();
  UserDbController userDbController = Get.find<UserDbController>();
  PostService postService = Get.find<PostService>();

  String? userName;
  String? uid;
  String? userImage;

  @override
  void onInit() {
    super.onInit();

    dynamic data = Get.arguments;

    userName = data['name'];
    uid = data['userId'];
    userImage = data['image'];
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
