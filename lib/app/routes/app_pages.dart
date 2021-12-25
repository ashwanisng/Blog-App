import 'package:get/get.dart';

import 'package:blog_app/app/modules/create_post/bindings/create_post_binding.dart';
import 'package:blog_app/app/modules/create_post/views/create_post_view.dart';
import 'package:blog_app/app/modules/entry/bindings/entry_binding.dart';
import 'package:blog_app/app/modules/entry/views/entry_view.dart';
import 'package:blog_app/app/modules/explore/bindings/explore_binding.dart';
import 'package:blog_app/app/modules/explore/views/explore_view.dart';
import 'package:blog_app/app/modules/home/bindings/home_binding.dart';
import 'package:blog_app/app/modules/home/views/home_view.dart';
import 'package:blog_app/app/modules/login/bindings/login_binding.dart';
import 'package:blog_app/app/modules/login/views/login_view.dart';
import 'package:blog_app/app/modules/notification/bindings/notification_binding.dart';
import 'package:blog_app/app/modules/notification/views/notification_view.dart';
import 'package:blog_app/app/modules/post/bindings/post_binding.dart';
import 'package:blog_app/app/modules/post/views/post_view.dart';
import 'package:blog_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:blog_app/app/modules/profile/views/profile_view.dart';
import 'package:blog_app/app/modules/register/bindings/register_binding.dart';
import 'package:blog_app/app/modules/register/views/register_view.dart';

// ignore_for_file: constant_identifier_names, prefer_const_constructors

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ENTRY;

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
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.POST,
      page: () => PostView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: _Paths.ENTRY,
      page: () => EntryView(),
      binding: EntryBinding(),
    ),
  ];
}
