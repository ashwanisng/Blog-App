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
                child: ListView.builder(
                  itemCount:
                      controller.followerFollowingDb.postCollection.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data =
                        controller.followerFollowingDb.postCollection[index];

                    DateTime time =
                        (DateTime.parse(data["createdAt"].toDate().toString()));

                    // numOfComments = controller.commentDbController
                    //     .getComment(postId: data["id"]);

                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => controller
                                    .followerFollowingDb.postCollection.isEmpty
                                ? const Header(
                                    username: "@username",
                                    name: "Name",
                                    image:
                                        'https://images.unsplash.com/photo-1637181871441-3fd29405bba4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1947&q=80',
                                    time: "few day ago",
                                  )
                                : Expanded(
                                    child: Header(
                                      username: '@${data['userNameOfUser']}',
                                      name: data['nameOfUser'],
                                      image: data['imageUrlOfUser'],
                                      time: timeago.format(time),
                                    ),
                                  ),
                          ),
                          // Expanded(child: TopicName(topicName: data["title"])),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const PostView(), arguments: {
                                "title": data["photoUrl"],
                                'captions': data["caption"],
                                'location': data["location"],
                                "content": data["content"],
                                "createdAt": data["createdAt"],
                                "postId": data["id"],
                                "imageUrl": controller.userDb.userData[0]
                                    ["photoUrl"],
                                "userName": controller.userDb.userData[0]
                                    ["userName"],
                                "userId": controller.userDb.userData[0]["uid"],
                              });
                            },
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.38,
                                  width: MediaQuery.of(context).size.width,
                                  child: CachedNetworkImage(
                                    imageUrl: data['postUrl'],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          // const Divider(),
                          Obx(
                            () => Expanded(
                              child: Footer(
                                likes: data["likes"],
                                likeIcon: controller.postService.isLiked.value
                                    ? Icon(
                                        Icons.thumb_up_alt_sharp,
                                        color: Env.colors.primaryBlue,
                                      )
                                    : const Icon(
                                        Icons.thumb_up_alt_sharp,
                                        color: Colors.grey,
                                      ),
                                onLikeOnPressed: () {
                                  controller.postService.isLiked.value == true
                                      ? controller.postService.isLiked.value =
                                          false
                                      : controller.postService.isLiked.value =
                                          true;

                                  if (controller.postService.isLiked.value ==
                                      true) {
                                    controller.postService.like();
                                  } else {
                                    controller.postService.decreaseLike();
                                  }
                                },
                                dislikes: data["dislikes"],
                                dislikeIcon:
                                    controller.postService.isDisliked.value
                                        ? const Icon(
                                            Icons.thumb_down_sharp,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.thumb_up_alt_sharp,
                                            color: Colors.grey,
                                          ),
                                onDislikeOnPressed: () {
                                  controller.postService.isDisliked.value ==
                                          true
                                      ? controller
                                          .postService.isDisliked.value = false
                                      : controller
                                          .postService.isDisliked.value = true;

                                  if (controller.postService.isDisliked.value ==
                                      true) {
                                    controller.postService
                                        .disLikeCountIncrease();
                                  } else {
                                    controller.postService
                                        .decreaseDisLikeCount();
                                  }
                                },
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
                ),
              )
            : const NoInternet(),
      ),
    );
  }
}


/**
 * 
 * ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final DocumentSnapshot doc = snapshot.data!.docs[index];
              DateTime time =
                  (DateTime.parse(doc["createdAt"].toDate().toString()));

              return SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => controller.userDb.userData.isEmpty
                          ? const Header(
                              username: "@username",
                              name: "Name",
                              image:
                                  'https://images.unsplash.com/photo-1637181871441-3fd29405bba4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1947&q=80',
                              time: "few day ago",
                            )
                          : Expanded(
                              child: Header(
                                username: controller.userDb.userData[0]
                                    ['userName'],
                                name: controller.userDb.userData[0]['name'],
                                image: controller.userDb.userData[0]
                                    ['photoUrl'],
                                time: timeago.format(time),
                              ),
                            ),
                    ),
                    Expanded(child: TopicName(topicName: doc["title"])),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const PostView(), arguments: {
                          "title": doc["title"],
                          "content": doc["content"],
                          "createdAt": doc["createdAt"],
                        });
                      },
                      child: Expanded(
                        child: DescriptionText(
                          description: doc["description"],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // const Divider(),
                    Obx(
                      () => Expanded(
                        child: Footer(
                          likes: doc["likes"],
                          likeIcon: controller.postService.isLiked.value
                              ? Icon(
                                  Icons.thumb_up_alt_sharp,
                                  color: Env.colors.primaryBlue,
                                )
                              : const Icon(
                                  Icons.thumb_up_alt_sharp,
                                  color: Colors.grey,
                                ),
                          onLikeOnPressed: () {
                            controller.postService.isLiked.value == true
                                ? controller.postService.isLiked.value = false
                                : controller.postService.isLiked.value = true;

                            if (controller.postService.isLiked.value == true) {
                              controller.postService.like();
                            } else {
                              controller.postService.decreaseLike();
                            }
                          },
                          dislikes: doc["dislikes"],
                          dislikeIcon: controller.postService.isDisliked.value
                              ? const Icon(
                                  Icons.thumb_down_sharp,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.thumb_up_alt_sharp,
                                  color: Colors.grey,
                                ),
                          onDislikeOnPressed: () {
                            controller.postService.isDisliked.value == true
                                ? controller.postService.isDisliked.value =
                                    false
                                : controller.postService.isDisliked.value =
                                    true;

                            if (controller.postService.isDisliked.value ==
                                true) {
                              controller.postService.disLikeCountIncrease();
                            } else {
                              controller.postService.decreaseDisLikeCount();
                            }
                          },
                          comments: controller
                              .followerFollowingDb.postCollection.length,
                          onCommentOnPressed: () {
                            // controller.commentOnPressed(doc);

                            // for (var i = 0;
                            //     i < controller.postService.followingList.length;
                            //     i++) {
                            //   print(controller.postService.followingList[i]);
                            // }
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
 */