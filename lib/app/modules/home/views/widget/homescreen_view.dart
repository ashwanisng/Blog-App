import 'package:blog_app/app/utils/no_internet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/home/controllers/home_controller.dart';
import 'package:blog_app/app/utils/footer.dart';
import 'package:blog_app/app/modules/home/views/components/header.dart';
import 'package:blog_app/app/modules/post/views/post_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreenView extends GetView<HomeController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Blog App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Env.colors.background,
      persistentFooterButtons: [
        controller.isBottomBannerAdLoaded.value
            ? SizedBox(
                height: controller.bottomBannerAd.size.height.toDouble(),
                width: controller.bottomBannerAd.size.width.toDouble(),
                child: AdWidget(
                  ad: controller.bottomBannerAd,
                ),
              )
            : Container(),
      ],
      body: Obx(
        () => controller.networkController.isInternetConnected.isTrue
            ? RefreshIndicator(
                onRefresh: () =>
                    controller.followerFollowingDb.getListOfUserFollowing(),
                child: controller.followerFollowingDb
                        .isPostCollectionListIsLoading.isFalse
                    ? ListView.builder(
                        itemCount: controller
                            .followerFollowingDb.postCollection.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = controller
                              .followerFollowingDb.postCollection[index];

                          DateTime time = (DateTime.parse(
                              data["createdAt"].toDate().toString()));

                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 1.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx(
                                  () => controller.followerFollowingDb
                                          .postCollection.isEmpty
                                      ? const Header(
                                          username: "@username",
                                          name: "Name",
                                          image:
                                              'https://images.unsplash.com/photo-1637181871441-3fd29405bba4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1947&q=80',
                                          time: "few day ago",
                                        )
                                      : Expanded(
                                          child: Header(
                                            username:
                                                '@${data['userNameOfUser']}',
                                            name: data['nameOfUser'],
                                            image: data['imageUrlOfUser'],
                                            time: timeago.format(time),
                                          ),
                                        ),
                                ),
                                const SizedBox(height: 5),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const PostView(), arguments: {
                                      "postUrl": data["postUrl"],
                                      'captions': data["caption"],
                                      'location': data["location"],
                                      "content": data["content"],
                                      "createdAt": data["createdAt"],
                                      "postId": data["id"],
                                      "imageUrl": controller.userDb.userData[0]
                                          ["photoUrl"],
                                      "userName": controller.userDb.userData[0]
                                          ["userName"],
                                      "userId": controller.userDb.userData[0]
                                          ["uid"],
                                      "postOwnerId": data["userId"],
                                      'userImageUrl': controller
                                          .userDb.userData[0]["photoUrl"],
                                    });
                                  },
                                  child: Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.38,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: CachedNetworkImage(
                                          imageUrl: data['postUrl'],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      data["caption"],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Env.textStyles.text,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                // const Divider(),
                                Obx(
                                  () => Expanded(
                                    child: Footer(
                                      likes: controller
                                          .postService.likeCount.value,
                                      likeIcon:
                                          controller.postService.isLiked.value
                                              ? Icon(
                                                  Icons.thumb_up_alt_sharp,
                                                  color: Env.colors.primaryBlue,
                                                )
                                              : const Icon(
                                                  Icons.thumb_up_alt_sharp,
                                                  color: Colors.grey,
                                                ),
                                      onLikeOnPressed: () =>
                                          controller.postService.handleLikePost(
                                        userId: data["userId"],
                                        postId: data["id"],
                                        postImage: data["postUrl"],
                                      ),
                                      comments: 0,
                                      onCommentOnPressed: () {},
                                    ),
                                  ),
                                ),
                                const Divider()
                              ],
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 1.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Shimmer.fromColors(
                                  child: const Header(
                                    username: "",
                                    name: "",
                                    image: "",
                                    time: "",
                                  ),
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                ),

                                const SizedBox(height: 5),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Shimmer.fromColors(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.38,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Shimmer.fromColors(
                                      child: Text(
                                        "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Env.textStyles.text,
                                      ),
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                // const Divider(),
                                Expanded(
                                  child: Shimmer.fromColors(
                                    child: Footer(
                                      likes: controller
                                          .postService.likeCount.value,
                                      likeIcon:
                                          controller.postService.isLiked.value
                                              ? Icon(
                                                  Icons.thumb_up_alt_sharp,
                                                  color: Env.colors.primaryBlue,
                                                )
                                              : const Icon(
                                                  Icons.thumb_up_alt_sharp,
                                                  color: Colors.grey,
                                                ),
                                      onLikeOnPressed: () {},
                                      comments: 0,
                                      onCommentOnPressed: () {},
                                    ),
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                  ),
                                ),
                                const Divider()
                              ],
                            ),
                          );
                        },
                      ),
              )
            : const NoInternet(),
      ),
    );
  }
}
