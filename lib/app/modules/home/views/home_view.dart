// ignore_for_file: use_key_in_widget_constructors

import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/create_post/views/create_post_view.dart';
import 'package:blog_app/app/modules/explore/views/explore_view.dart';
import 'package:blog_app/app/modules/home/controllers/landingpage_controller.dart';
import 'package:blog_app/app/modules/home/views/widget/homescreen_view.dart';
import 'package:blog_app/app/modules/notification/views/notification_view.dart';
import 'package:blog_app/app/modules/profile/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final LandingPageController landingPageController =
      Get.put(LandingPageController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.background,
      body: Obx(
        () => IndexedStack(
          index: landingPageController.slectedIndex.value,
          children: const [
            HomeScreenView(),
            ExploreView(),
            CreatePostView(),
            NotificationView(),
            ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          color: Env.colors.primaryWhite,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Env.colors.background,
            selectedItemColor: Env.colors.bottomNavBar,
            unselectedItemColor: Env.colors.primaryGray,
            selectedLabelStyle: Env.textStyles.labelText,
            // selectedIconTheme: IconThemeData(
            //   color: Env.colors.bottomNavBar,
            // ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle, size: 30),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bell),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: landingPageController.changeIndex,
            currentIndex: landingPageController.slectedIndex.value,
          ),
        ),
      ),
    );
  }
}
