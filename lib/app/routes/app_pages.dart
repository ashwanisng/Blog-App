// ignore_for_file: constant_identifier_names

import 'package:blog_app/app/modules/create_post/bindings/create_post_binding.dart';
import 'package:blog_app/app/modules/create_post/views/create_post_view.dart';
import 'package:blog_app/app/modules/explore/bindings/explore_binding.dart';
import 'package:blog_app/app/modules/explore/views/explore_view.dart';
import 'package:blog_app/app/modules/home/bindings/home_binding.dart';
import 'package:blog_app/app/modules/home/views/home_view.dart';
import 'package:blog_app/app/modules/notification/bindings/notification_binding.dart';
import 'package:blog_app/app/modules/notification/views/notification_view.dart';
import 'package:blog_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:blog_app/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_POST,
      page: () => CreatePostView(),
      binding: CreatePostBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
