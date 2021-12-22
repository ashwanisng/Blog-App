import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/utils/no_internet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
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
                    .orderBy('timestamp', descending: true)
                    .limit(50)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index];
                        DateTime time = (DateTime.parse(
                            data["timestamp"].toDate().toString()));

                        if (data['type'] == 'like') {
                          return Column(
                            // Text(
                            // '${data['userName']} has ${data['type']}d your post'),
                            children: [
                              ListTile(
                                title: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${data['userName']} ',
                                        style: Env.textStyles.text.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'has ',
                                        style:
                                            Env.textStyles.labelText.copyWith(
                                          color: Colors.black,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${data['type']}d',
                                        style:
                                            Env.textStyles.labelText.copyWith(
                                          color: Colors.black,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' your post.',
                                        style:
                                            Env.textStyles.labelText.copyWith(
                                          color: Colors.black,
                                          fontFamily: "Roboto",
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                subtitle: Text(timeago.format(time)),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  backgroundImage: CachedNetworkImageProvider(
                                    data['userImage'],
                                  ),
                                ),
                                trailing: CachedNetworkImage(
                                  imageUrl: data["postImage"],
                                  height: 50,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Divider(thickness: 1),
                            ],
                          );
                        } else if (data['type'] == 'comment') {
                          return Column(
                            children: [
                              ListTile(
                                title: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${data['userName']} ',
                                        style: Env.textStyles.text.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'has commented ',
                                        style:
                                            Env.textStyles.labelText.copyWith(
                                          color: Colors.black,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${data['commentData']} ',
                                        style: Env.textStyles.text.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'on your post',
                                        style:
                                            Env.textStyles.labelText.copyWith(
                                          color: Colors.black,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    timeago.format(time),
                                    style: Env.textStyles.labelText.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  maxRadius: 22,
                                  backgroundImage: CachedNetworkImageProvider(
                                    data['userImage'],
                                  ),
                                ),
                                trailing: CachedNetworkImage(
                                  imageUrl: data["postImage"],
                                  height: 50,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Divider(thickness: 1),
                            ],
                          );
                        } else {
                          return Container();
                        }
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
