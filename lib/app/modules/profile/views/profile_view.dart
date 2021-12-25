import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/profile/views/components/edit_profile.dart';
import 'package:blog_app/app/utils/no_internet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:blog_app/app/modules/profile/controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileHeight = MediaQuery.of(context).size.height * 0.18;

    final backgroundCover = MediaQuery.of(context).size.height * 0.15;

    final top = backgroundCover - profileHeight / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Account',
          style: Env.textStyles.text.copyWith(color: Env.colors.primaryBlue),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              controller.authService.signOut();
            },
          ),
        ],
        iconTheme: IconThemeData(color: Env.colors.primaryBlue),
      ),
      body: Obx(
        () => controller.networkController.isInternetConnected.isTrue
            ? Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: profileHeight / 2),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      Positioned(
                        top: top,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Obx(
                            () => controller.userDbController.userData[0]
                                        ['photoUrl'] ==
                                    null
                                ? CircleAvatar(
                                    radius: profileHeight / 2,
                                    backgroundImage:
                                        const CachedNetworkImageProvider(
                                      "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: profileHeight / 2,
                                    backgroundImage: CachedNetworkImageProvider(
                                      controller.userDbController.userData[0]
                                          ['photoUrl'],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              Get.to(() => const EditProfile());
                            },
                            icon: Icon(
                              Icons.settings,
                              color: Env.colors.primaryBlack,
                              size: 30,
                            ),
                          ),
                        ),
                        top: 0,
                        right: 0,
                      ),
                    ],
                  ),
                  Obx(
                    () => controller.userDbController.userData.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Ashwani Kumar SIngh",
                                    style: Env.textStyles.descriptionText,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    "@ashwanisng",
                                    style: Env.textStyles.text.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: Text(
                                    "Hello there I am Ashwani Kumar Singh! I am a Flutter Developer!",
                                    style: Env.textStyles.labelText,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    controller.userDbController
                                            .userData[0]['name']
                                            .toString()
                                            .isEmpty
                                        ? 'Name'
                                        : controller.userDbController
                                            .userData[0]['name']
                                            .toString(),
                                    style: Env.textStyles.descriptionText,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    controller.userDbController
                                            .userData[0]['userName']
                                            .toString()
                                            .isEmpty
                                        ? '@userName'
                                        : '@${controller.userDbController.userData[0]['userName']}',
                                    style: Env.textStyles.text.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: Text(
                                    controller
                                            .userDbController.userData[0]['bio']
                                            .toString()
                                            .isEmpty
                                        ? 'Bio'
                                        : controller
                                            .userDbController.userData[0]['bio']
                                            .toString(),
                                    style: Env.textStyles.labelText,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Obx(
                                  () => Text(
                                    controller.postService.userPostCount
                                        .toString(),
                                    style: Env.textStyles.text.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "Posts",
                                  style: Env.textStyles.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                  child: Obx(
                                () => Text(
                                  controller.followerFollowingDb
                                      .followerCountOfViwedUser
                                      .toString(),
                                  style: Env.textStyles.text.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )),
                              Flexible(
                                child: Text(
                                  "Followers",
                                  style: Env.textStyles.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Obx(
                                  () => Text(
                                    controller.followerFollowingDb
                                        .followingCountOfViwedUser
                                        .toString(),
                                    style: Env.textStyles.text.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "Following",
                                  style: Env.textStyles.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1),
                ],
              )
            : const NoInternet(),
      ),
    );
  }
}
