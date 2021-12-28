// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/database/comment_db_controller.dart';
import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:blog_app/app/modules/post/controllers/post_controller.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';

class ViewUserPostController extends GetxController {
  String? postId;
  String? postImage;
  DateTime? postDate;
  String? postOwnerName;
  String? caption;

  NetworkController networkController = Get.find<NetworkController>();
  CommentDbController commentDbController = Get.find<CommentDbController>();
  UserDbController userDbController = Get.find<UserDbController>();
  FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();
  PostController postController = Get.find<PostController>();

  Future<void> shareFun(dynamic link, String title, String text) async {
    await FlutterShare.share(
      title: title,
      text: text,
      linkUrl: link,
      chooserTitle: 'Everywhere',
    );
  }

  @override
  void onInit() {
    super.onInit();

    dynamic data = Get.arguments;

    postId = data['postId'];
    postImage = data['postUrl'];
    postDate = (DateTime.parse(data["createdAt"].toDate().toString()));
    postOwnerName = data['postOwnerName'];
    caption = data['caption'];
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
