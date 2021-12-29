// ignore_for_file: unnecessary_overrides

import 'dart:io';

import 'package:blog_app/app/data/model/user.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:blog_app/app/modules/profile/views/profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  var selectImagePath = ''.obs;

  late String downloadUrl;

  late File file;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  UserDbController userDb = Get.find<UserDbController>();

  uploadUserDetails() async {
    userDb.uploadUserData(
      UserModel(
        uid: auth.currentUser!.uid,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        photoUrl: await uploadProfilePicToDatabse(),
        userName: usernameController.text.trim(),
        bio: bioController.text.trim(),
        location: locationController.text.trim(),
        isFollowing: false,
      ),
    );
    Get.offAll(() => const ProfileView());
  }

  Future<String> uploadProfilePicToDatabse() async {
    try {
      userDb.isUserDataUploading.value = true;
      var snapshot = await storage
          .ref()
          .child('profileimage/${file.path.split('/').last}')
          .putFile(file);
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      return Future.error(e);
    } finally {
      userDb.isUserDataUploading.value = false;
    }
  }

  Future selectProfileImage(ImageSource imageSource) async {
    var pickedFile = await ImagePicker().pickImage(source: imageSource);

    var checkPermission = await Permission.photos.status;

    if (checkPermission.isGranted) {
      selectImagePath.value = pickedFile!.path;

      if (pickedFile.path.isNotEmpty) {
        selectImagePath.value = pickedFile.path;

        file = File(selectImagePath.value);
      } else {
        Get.snackbar(
          'Error',
          'Image Not Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Permission Denied',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    }
    return selectImagePath.value;
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
