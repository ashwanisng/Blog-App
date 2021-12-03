import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/profile/views/components/edit_profile.dart';
import 'package:blog_app/app/utils/custom_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:blog_app/app/modules/profile/controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Account',
          style: Env.textStyles.text.copyWith(color: Env.colors.primaryBlue),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: controller.userDbController.userData.isEmpty
                    ? Row(
                        children: [
                          const SizedBox(
                            width: 64,
                            height: 64,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1637181871441-3fd29405bba4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1947&q=80'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                // Get.to(() => EditProfileView());
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: Env.textStyles.text,
                                  ),
                                  Text(
                                    '@userName',
                                    style: Env.textStyles.labelText,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : Obx(
                        () => Row(
                          children: [
                            SizedBox(
                              width: 64,
                              height: 64,
                              child: controller.userDbController.userData[0]
                                          ['photoUrl'] ==
                                      null
                                  ? const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://images.unsplash.com/photo-1637181871441-3fd29405bba4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1947&q=80'),
                                    )
                                  : CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        controller.userDbController.userData[0]
                                            ['photoUrl'],
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  // Get.to(() => EditProfileView());
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.userDbController
                                              .userData[0]['name']
                                              .toString()
                                              .isEmpty
                                          ? 'Name'
                                          : controller.userDbController
                                              .userData[0]['name']
                                              .toString(),
                                      style: Env.textStyles.text,
                                    ),
                                    Text(
                                      controller.userDbController
                                              .userData[0]['userName']
                                              .toString()
                                              .isEmpty
                                          ? '@userName'
                                          : controller.userDbController
                                              .userData[0]['userName']
                                              .toString(),
                                      style: Env.textStyles.labelText,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            ),
            CustomCardView(
              cardName: 'Edit Profile',
              cardSubTitile: "Edit your profile",
              icon: Icons.arrow_forward_ios,
              onPress: () {
                Get.to(() => const EditProfile());
              },
            ),
            CustomCardView(
              cardName: 'Payment Method',
              cardSubTitile: "Visa **34",
              icon: Icons.arrow_forward_ios,
              onPress: () {},
            ),
            CustomCardView(
              cardName: 'Promocodes',
              cardSubTitile: "You have special promocodes",
              icon: Icons.arrow_forward_ios,
              onPress: () {},
            ),
            CustomCardView(
              cardName: 'Logout',
              cardSubTitile: "Sign out of your account",
              icon: Icons.logout,
              onPress: () {
                controller.authService.signOut();
              },
            ),
            CustomCardView(
              cardName: 'Settings',
              cardSubTitile: "Theme, notifications",
              icon: Icons.arrow_forward_ios,
              onPress: () {
                // Get.offAll(Settings());
                // controller.auth.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
