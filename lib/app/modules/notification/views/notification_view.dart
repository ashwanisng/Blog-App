import 'package:blog_app/app/utils/no_internet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
            ? StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('notifications')
                    .doc(controller.userDb.userData[0]['uid'])
                    .collection("notifications")
                    .orderBy('timestamp', descending: false)
                    .limit(50)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index];
                        return ListTile(
                          title: Text(data['userName']),
                          subtitle: Text(data['type']),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
            : const NoInternet(),
      ),
    );
  }
}
