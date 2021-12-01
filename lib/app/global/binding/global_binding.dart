import 'package:blog_app/app/global/firebase/auth/auth.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/modules/create_post/controllers/create_post_controller.dart';
import 'package:blog_app/app/modules/explore/controllers/explore_controller.dart';
import 'package:blog_app/app/modules/home/controllers/home_controller.dart';
import 'package:blog_app/app/modules/login/controllers/login_controller.dart';
import 'package:blog_app/app/modules/notification/controllers/notification_controller.dart';
import 'package:blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:blog_app/app/modules/register/controllers/register_controller.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<CreatePostController>(
      () => CreatePostController(),
    );

    Get.lazyPut<ExploreController>(
      () => ExploreController(),
    );

    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
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
  }
}
