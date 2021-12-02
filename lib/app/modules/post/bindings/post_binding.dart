import 'package:get/get.dart';

import 'package:blog_app/app/modules/post/controllers/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>(
      () => PostController(),
    );
  }
}
