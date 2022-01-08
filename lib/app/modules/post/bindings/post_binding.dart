import 'package:blog_app/app/modules/explore/controllers/view_user_controller.dart';
import 'package:blog_app/app/modules/viewuser/controllers/viewuser_controller.dart';
import 'package:get/get.dart';

import 'package:blog_app/app/modules/post/controllers/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>(
      () => PostController(),
    );
    Get.lazyPut<ViewuserController>(
      () => ViewuserController(),
      fenix: true,
    );
  }
}
