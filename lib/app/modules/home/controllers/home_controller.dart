// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/service/ad_helper.dart';
import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/database/comment_db_controller.dart';
import 'package:blog_app/app/global/firebase/database/follower_following_db.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserDbController userDb = Get.find<UserDbController>();

  PostService postService = Get.find<PostService>();

  FollowerFollowingDb followerFollowingDb = Get.find<FollowerFollowingDb>();

  NetworkController networkController = Get.find<NetworkController>();

  CommentDbController commentDbController = Get.find<CommentDbController>();

  RxList finalPosts = [].obs;

  late BannerAd bottomBannerAd;
  RxBool isBottomBannerAdLoaded = false.obs;

  void _createBottomBannerAd() {
    bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBottomBannerAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    bottomBannerAd.load();
  }

  @override
  void onInit() {
    followerFollowingDb.getListOfUserFollowing();
    super.onInit();

    userDb.fetchAllUserDetails();
    _createBottomBannerAd();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    bottomBannerAd.dispose();
  }
}
