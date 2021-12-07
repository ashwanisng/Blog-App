import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/explore/controllers/view_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewUser extends GetView<ViewUserController> {
  const ViewUser({Key? key}) : super(key: key);

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
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          backgroundImage: NetworkImage(
                            controller.image ?? "https://i.pravatar.cc/300",
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Text(
                            controller.name!,
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
                              controller.bio!,
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
                                Text(
                                  "0",
                                  style: Env.textStyles.title.copyWith(
                                    fontWeight: FontWeight.w600,
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
                                    controller.followerFollowingDb
                                        .followerCountOfViwedUser.value
                                        .toString(),
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
                                    controller.followerFollowingDb
                                        .followingCountOfViwedUser.value
                                        .toString(),
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
                          onPressed: () {
                            controller.followerFollowingDb.isFollowing.value ==
                                    true
                                ? controller.followerFollowingDb.isFollowing
                                    .value = false
                                : controller.followerFollowingDb.isFollowing
                                    .value = true;

                            if (controller
                                    .followerFollowingDb.isFollowing.value ==
                                true) {
                              controller.followerFollowingDb.addFollowing(
                                currentUserId: controller
                                    .userDbController.auth.currentUser!.uid,
                                followingId: controller.uid!,
                              );

                              controller.followerFollowingDb.addFollower(
                                currentUserId: controller.uid!,
                                followerId: controller
                                    .userDbController.auth.currentUser!.uid,
                              );
                              print(controller
                                  .followerFollowingDb.isFollowing.value);
                              print(controller.uid);

                              // controller.userDbController.updateFollowingList(
                              //   isFollowing: true,
                              //   userId: controller.uid!,
                              // );
                            } else {
                              controller.followerFollowingDb.removeFollowing(
                                currentUserId: controller
                                    .userDbController.auth.currentUser!.uid,
                                followingId: controller.uid!,
                              );

                              controller.followerFollowingDb.removeFollower(
                                currentUserId: controller.uid!,
                                followerId: controller
                                    .userDbController.auth.currentUser!.uid,
                              );

                              // controller.userDbController.updateFollowingList(
                              //     isFollowing: false, userId: controller.uid!);
                            }
                          },
                          child:
                              controller.followerFollowingDb.isFollowing.isTrue
                                  ? const Text("Following")
                                  : const Text("Follow"),
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
