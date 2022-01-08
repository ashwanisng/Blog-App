import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/explore/controllers/view_user_controller.dart';
import 'package:blog_app/app/modules/profile/views/components/view_user_post.dart';
import 'package:blog_app/app/utils/no_post_avilable.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: ListView(
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
                                Obx(
                                  () => Text(
                                    controller.postService.userPostCount.value
                                        .toString(),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('posts')
                  .doc(controller.uid)
                  .collection('userPosts')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: Env.textStyles.text,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const NoPostAvilable();
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const ViewUserPost(),
                            arguments: {
                              'postUrl': data['postUrl'],
                              'createdAt': data['createdAt'],
                              'postId': data['id'],
                              'postOwnerName': data['nameOfUser'],
                              'caption': data['caption'],
                            },
                          );
                        },
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data!.docs[index]['postUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
