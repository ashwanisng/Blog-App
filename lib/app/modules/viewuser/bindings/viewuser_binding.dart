import 'package:get/get.dart';

import 'package:blog_app/app/modules/viewuser/controllers/viewuser_controller.dart';

class ViewuserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewuserController>(
      () => ViewuserController(),
    );
  }
}
