import 'package:blog_app/app/utils/no_internet.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:blog_app/app/modules/notification/controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationView'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.networkController.isInternetConnected.isTrue
            ? const Center(
                child: Text("Notification page"),
              )
            : const NoInternet(),
      ),
    );
  }
}
