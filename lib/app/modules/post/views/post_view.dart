import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/home/views/components/header.dart';
import 'package:blog_app/app/utils/footer.dart';
import 'package:blog_app/app/utils/no_internet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:get/get.dart';

import 'package:blog_app/app/modules/post/controllers/post_controller.dart';
import 'package:intl/intl.dart';

class PostView extends GetView<PostController> {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Env.colors.primaryBlue,
            ),
            onPressed: () {
              controller.shareFun(
                controller.postUrl!,
                controller.caption!,
                controller.postOwnerName!,
              );
            },
          ),
        ],
        iconTheme: IconThemeData(
          color: Env.colors.primaryBlue,
        ),
      ),
      body: Obx(
        () => controller.networkController.isInternetConnected.isTrue
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(
                        username: '@${controller.postOwnerUsername!}',
                        name: controller.postOwnerName!,
                        image: controller.postOwnerPhotoUrl!,
                        time: timeago.format(controller.date!),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: CachedNetworkImage(
                            imageUrl: controller.postUrl!,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              DateFormat.yMMMMEEEEd().format(controller.date!),
                              textAlign: TextAlign.right,
                              style: Env.textStyles.labelText.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          )),
                      const SizedBox(height: 10),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Text(
                            controller.caption!,
                            style: Env.textStyles.smallText,
                          ),
                        ),
                      ),
                      const Divider(),
                      Footer(
                        likes: 142,
                        // dislikes: 142,
                        comments: 5,
                        onLikeOnPressed: () {},
                        // onDislikeOnPressed: () {},
                        onCommentOnPressed: () {},
                        likeIcon: const Icon(Icons.thumb_up),
                        onShareOnPressed: () {},
                        // dislikeIcon: const Icon(Icons.thumb_down),
                      ),
                      const Divider(),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('comments')
                            .doc(controller.postId!)
                            .collection('comments')
                            .orderBy("timestamp", descending: false)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data!.docs[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                    data['userImageUrl'],
                                  ),
                                ),
                                title: Text(
                                  data['userName'],
                                  style: Env.textStyles.commentUserNameStyle
                                      .copyWith(fontSize: 15),
                                ),
                                subtitle: Text(data['comment'],
                                    style: Env.textStyles.labelText
                                        .copyWith(color: Colors.black)),
                                trailing: Text(
                                  timeago.format(data['timestamp'].toDate()),
                                  style: Env.textStyles.labelText.copyWith(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            controller.userImageUrl!,
                          ),
                        ),
                        title: TextFormField(
                          controller: controller.commentController,
                          decoration: const InputDecoration(
                            hintText: 'Comente here...',
                            border: InputBorder.none,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Env.colors.primaryGreen,
                          ),
                          onPressed: () => controller.uploadComment(),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const NoInternet(),
      ),
    );
  }
}
