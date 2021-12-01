import 'package:get/get.dart';

import 'package:blog_app/app/modules/create_post/controllers/create_post_controller.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePostController>(
      () => CreatePostController(),
    );
  }
}
