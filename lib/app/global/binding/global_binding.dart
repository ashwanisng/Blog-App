import 'package:blog_app/app/global/firebase/auth/auth.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:blog_app/app/modules/create_post/controllers/create_post_controller.dart';
import 'package:blog_app/app/modules/explore/controllers/explore_controller.dart';
import 'package:blog_app/app/modules/home/controllers/home_controller.dart';
import 'package:blog_app/app/modules/login/controllers/login_controller.dart';
import 'package:blog_app/app/modules/notification/controllers/notification_controller.dart';
import 'package:blog_app/app/modules/post/controllers/post_controller.dart';
import 'package:blog_app/app/modules/profile/controllers/editprofile_controller.dart';
import 'package:blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:blog_app/app/modules/register/controllers/register_controller.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );

    Get.lazyPut<CreatePostController>(
      () => CreatePostController(),
      fenix: true,
    );

    Get.lazyPut<ExploreController>(
      () => ExploreController(),
      fenix: true,
    );

    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
      fenix: true,
    );

    Get.lazyPut<LoginController>(
      () => LoginController(),
      fenix: true,
    );

    Get.lazyPut<RegisterController>(
      () => RegisterController(),
      fenix: true,
    );

    Get.lazyPut<FirebaseAuthService>(
      () => FirebaseAuthService(),
      fenix: true,
    );

    Get.lazyPut<PostService>(
      () => PostService(),
      fenix: true,
    );

    Get.lazyPut<PostController>(
      () => PostController(),
      fenix: true,
    );

    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
      fenix: true,
    );

    Get.lazyPut<UserDbController>(
      () => UserDbController(),
      fenix: true,
    );
  }
}
