import 'package:get/get.dart';

import 'package:blog_app/app/modules/entry/controllers/entry_controller.dart';

class EntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryController>(
      () => EntryController(),
    );
  }
}
