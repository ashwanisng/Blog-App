import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/home/controllers/home_controller.dart';
import 'package:blog_app/app/modules/home/views/components/description_text.dart';
import 'package:blog_app/app/modules/home/views/components/footer.dart';
import 'package:blog_app/app/modules/home/views/components/header.dart';
import 'package:blog_app/app/modules/home/views/components/topic_name.dart';
import 'package:blog_app/app/modules/post/views/post_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenView extends GetView<HomeController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Blog App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Env.colors.background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("posts")
            .doc(controller.auth.currentUser!.uid)
            .collection("posts")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final DocumentSnapshot doc = snapshot.data!.docs[index];

              return SizedBox(
                height: MediaQuery.of(context).size.height / 2.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.userDb.userData.isEmpty
                        ? const Header(
                            username: "@username",
                            name: "Name",
                            image:
                                'https://images.unsplash.com/photo-1637181871441-3fd29405bba4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1947&q=80',
                          )
                        : Obx(
                            () => Header(
                              username: controller.userDb.userData[0]
                                  ['userName'],
                              name: controller.userDb.userData[0]['name'],
                              image: controller.userDb.userData[0]['photoUrl'],
                            ),
                          ),
                    TopicName(topicName: doc["title"]),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const PostView(), arguments: {
                          "title": doc["title"],
                          "content": doc["content"],
                          "createdAt": doc["createdAt"],
                        });
                      },
                      child: DescriptionText(
                        description: doc["description"],
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Divider(),
                    Footer(
                      likes: doc["likes"],
                      dislikes: doc["dislikes"],
                      comments: 0,
                    ),
                    const Divider()
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
