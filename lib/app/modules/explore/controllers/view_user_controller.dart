// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:get/get.dart';

class ViewUserController extends GetxController {
  String? bio;
  String? name;
  String? image;
  String? uid;

  FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();
  UserDbController userDbController = Get.find<UserDbController>();

  @override
  void onInit() {
    super.onInit();

    dynamic data = Get.arguments;

    name = data['name'];
    bio = data['bio'];
    image = data['image'];
    uid = data['uid'];
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
