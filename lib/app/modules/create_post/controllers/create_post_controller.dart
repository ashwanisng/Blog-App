// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/model/post.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CreatePostController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  PostService postService = Get.find<PostService>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Uuid uuid = const Uuid();

  UserDbController userDbController = Get.find<UserDbController>();

  void createPost() {
    postService.uploadUserPost(
      PostModel(
        id: uuid.v4(),
        title: titleController.text,
        content: contentController.text,
        description: descriptionController.text,
        userId: firebaseAuth.currentUser!.uid,
        likes: 0,
        dislikes: 0,
        createdAt: DateTime.now(),
        imageUrlOfUser: userDbController.userData[0]['photoUrl'],
        userNameOfUser: userDbController.userData[0]['userName'],
        nameOfUser: userDbController.userData[0]['name'],
      ),
    );
    titleController.clear();
    descriptionController.clear();
    contentController.clear();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
