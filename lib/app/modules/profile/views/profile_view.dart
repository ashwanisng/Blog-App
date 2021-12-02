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
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                          children: [
                            Text(
                              'Ashwani Kumar Singh',
                              style: Env.textStyles.text,
                            ),
                            Text(
                              'ashwanicena5@gmail.com',
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
            CustomCardView(
              cardName: 'Edit Profile',
              cardSubTitile: "Edit your profile",
              icon: Icons.arrow_forward_ios,
              onPress: () {
                Get.to(() => EditProfile());
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
              cardName: 'My reviews',
              cardSubTitile: "Reviews for 4 items",
              icon: Icons.arrow_forward_ios,
              onPress: () {},
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
