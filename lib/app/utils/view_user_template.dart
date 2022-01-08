import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ViewUserTemplate extends StatelessWidget {
  String? imageUrl;
  String? name;
  String? bio;
  String userPostCount;
  String userFollowersCount;
  String userFollowingCount;
  String buttonName;
  Function()? onPressed;

  ViewUserTemplate({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.bio,
    required this.userPostCount,
    required this.userFollowersCount,
    required this.userFollowingCount,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Env.colors.primaryIndigo,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: CachedNetworkImageProvider(
                            imageUrl!,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Text(
                            name!,
                            style: Env.textStyles.title.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Center(
                            child: Text(
                              bio!,
                              style: Env.textStyles.labelText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                  () => Text(
                                    userPostCount,
                                    style: Env.textStyles.title.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Posts",
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                  () => Text(
                                    userFollowersCount,
                                    style: Env.textStyles.title.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Followers",
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                  () => Text(
                                    userFollowingCount,
                                    style: Env.textStyles.title.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Following",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => MaterialButton(
                          onPressed: onPressed,
                          // () {
                          // controller.followerFollowingDb.isFollowing.value ==
                          //         true
                          //     ? controller.followerFollowingDb.isFollowing
                          //         .value = false
                          //     : controller.followerFollowingDb.isFollowing
                          //         .value = true;

                          // if (controller
                          //         .followerFollowingDb.isFollowing.value ==
                          //     true) {
                          //   controller.followerFollowingDb.addFollowing(
                          //     currentUserId: controller
                          //         .userDbController.auth.currentUser!.uid,
                          //     followingId: controller.uid!,
                          //   );

                          //   controller.followerFollowingDb.addFollower(
                          //     currentUserId: controller.uid!,
                          //     followerId: controller
                          //         .userDbController.auth.currentUser!.uid,
                          //   );
                          // } else {
                          //   controller.followerFollowingDb.removeFollowing(
                          //     currentUserId: controller
                          //         .userDbController.auth.currentUser!.uid,
                          //     followingId: controller.uid!,
                          //   );

                          //   controller.followerFollowingDb.removeFollower(
                          //     currentUserId: controller.uid!,
                          //     followerId: controller
                          //         .userDbController.auth.currentUser!.uid,
                          //   );
                          // }
                          // },
                          child: Text(buttonName),
                          color: Env.colors.primaryIndigo,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 2),
        ],
      ),
    );
  }
}
