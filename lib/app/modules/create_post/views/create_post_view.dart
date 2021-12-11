import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/create_post/views/components/create_post_header.dart';
import 'package:blog_app/app/utils/no_internet.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:blog_app/app/modules/create_post/controllers/create_post_controller.dart';

class CreatePostView extends GetView<CreatePostController> {
  const CreatePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.background,
      appBar: AppBar(
        title: const Text(
          'Share your thoughts',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              controller.createPost();
            },
            child: Text(
              "Post",
              style: Env.textStyles.text,
            ),
          ),
        ],
      ),
      body: Obx(
        () => controller.networkController.isInternetConnected.isTrue
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(
                      () => controller.postService.isUploading.value
                          ? LinearProgressIndicator(
                              color: Env.colors.primaryGreen,
                            )
                          : controller.userDbController.userData.isEmpty
                              ? const CreatePostHeader(
                                  name: "Name",
                                  image:
                                      'https://images.unsplash.com/photo-1637181871441-3fd29405bba4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1947&q=80',
                                  userName: "@username",
                                )
                              : CreatePostHeader(
                                  name: controller
                                          .userDbController.userData[0]['name']
                                          .toString()
                                          .isEmpty
                                      ? "Name"
                                      : controller
                                          .userDbController.userData[0]['name']
                                          .toString(),
                                  image: controller.userDbController.userData[0]
                                          ['photoUrl'] ??
                                      'https://images.unsplash.com/photo-1637181871441-3fd29405bba4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1947&q=80',
                                  userName: controller.userDbController
                                          .userData[0]['userName']
                                          .toString()
                                          .isEmpty
                                      ? "@username"
                                      : '@${controller.userDbController.userData[0]['userName']}',
                                ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     height: MediaQuery.of(context).size.height * 0.3,
                    //     child: Center(
                    //       child: IconButton(
                    //           onPressed: () {},
                    //           icon: const Icon(
                    //             Icons.image,
                    //             size: 50,
                    //           )),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller.titleController,
                        decoration: InputDecoration(
                          labelStyle: Env.textStyles.text,
                          hintText: 'Topic name?',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        scrollPadding: const EdgeInsets.all(20.0),
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        autofocus: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller.descriptionController,
                        decoration: InputDecoration(
                          labelStyle: Env.textStyles.text,
                          hintText: 'Little description about the topic?',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        scrollPadding: const EdgeInsets.all(20.0),
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        autofocus: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller.contentController,
                        decoration: InputDecoration(
                          labelStyle: Env.textStyles.text,
                          hintText: 'What do you want to talk about?',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        scrollPadding: const EdgeInsets.all(20.0),
                        keyboardType: TextInputType.multiline,
                        maxLines: 15,
                        autofocus: true,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.image,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : const NoInternet(),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
