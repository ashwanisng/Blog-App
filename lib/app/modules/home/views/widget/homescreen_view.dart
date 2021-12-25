import 'package:blog_app/app/utils/no_internet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
                                      "postOwnerId": data["userId"],
                                      'postOwnerImageUrl':
                                          data["imageUrlOfUser"],
                                      'postOwnerName': data["nameOfUser"],
                                      'postOwnerUsername':
                                          data["userNameOfUser"],
                                      "imageUrl": controller.userDb.userData[0]
                                          ["photoUrl"],
                                      "userName": controller.userDb.userData[0]
                                          ["userName"],
                                      "userId": controller.userDb.userData[0]
                                          ["uid"],
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
                                      onShareOnPressed: () {
                                        controller.shareFun(
                                          data["postUrl"],
                                          data["nameOfUser"],
                                          data["caption"],
                                        );
                                      },
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
                            height: MediaQuery.of(context).size.height / 1.71,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Shimmer.fromColors(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 4,
                                          ),
                                          child: Expanded(
                                            child: Shimmer.fromColors(
                                              child: Container(
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                  radius: 26,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.grey[300],
                                                ),
                                              ),
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[100]!,
                                            ),
                                          ),
                                        ),
                                        // const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Shimmer.fromColors(
                                                child: Container(
                                                  height: 16,
                                                  color: Colors.grey[300],
                                                ),
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                              ),
                                              Shimmer.fromColors(
                                                child: Container(
                                                  height: 10,
                                                  color: Colors.grey[300],
                                                ),
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: Shimmer.fromColors(
                                                  child: Container(
                                                    height: 16,
                                                    color: Colors.grey[300],
                                                  ),
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Shimmer.fromColors(
                                                    child: Icon(
                                                      Icons.more_vert,
                                                      color: Colors.grey[300],
                                                    ),
                                                    baseColor:
                                                        Colors.grey[300]!,
                                                    highlightColor:
                                                        Colors.grey[100]!),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Shimmer.fromColors(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.32,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.grey[300],
                                    ),
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  child: Shimmer.fromColors(
                                    child: Container(
                                      height: 16,
                                      color: Colors.grey[300],
                                    ),
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Shimmer.fromColors(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Shimmer.fromColors(
                                                child: Icon(
                                                  Icons.thumb_up,
                                                  color: Colors.grey[300],
                                                ),
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                              ),
                                              onPressed: () {},
                                            ),
                                            const Text(""),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Shimmer.fromColors(
                                                child: Icon(
                                                  Icons.comment,
                                                  color: Colors.grey[300],
                                                ),
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                              ),
                                              onPressed: () {},
                                            ),
                                            const Text(""),
                                          ],
                                        ),
                                        IconButton(
                                          icon: Shimmer.fromColors(
                                            child: Icon(
                                              CupertinoIcons.share,
                                              color: Colors.grey[300],
                                            ),
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                ),
                                Shimmer.fromColors(
                                  child: Divider(
                                    color: Colors.grey[300],
                                  ),
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                ),
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
