import 'package:blog_app/app/modules/create_post/controllers/create_post_controller.dart';
import 'package:blog_app/app/modules/explore/controllers/explore_controller.dart';
import 'package:blog_app/app/modules/home/controllers/home_controller.dart';
import 'package:blog_app/app/modules/notification/controllers/notification_controller.dart';
import 'package:blog_app/app/modules/profile/controllers/profile_controller.dart';
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
  }
}
