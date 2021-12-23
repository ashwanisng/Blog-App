// ignore_for_file: unnecessary_overrides

import 'dart:io';

import 'package:blog_app/app/data/model/post.dart';
import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  PostService postService = Get.find<PostService>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController captionController = TextEditingController();

  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  late var imagePath = ''.obs;
  late String downloadUrl;

  // Uuid uuid = const Uuid();

  UserDbController userDbController = Get.find<UserDbController>();
  NetworkController networkController = Get.find<NetworkController>();

  // var id = const Uuid().v4();

  void createPost() {
    postService.uploadUserPost(
      PostModel(
        id: postService.id,
        caption: captionController.text,
        location: locationController.text,
        postUrl: downloadUrl,
        userId: firebaseAuth.currentUser!.uid,
        likes: {
          firebaseAuth.currentUser!.uid: false,
        },
        isLiked: false,
        likeCount: 0,
        createdAt: DateTime.now(),
        imageUrlOfUser: userDbController.userData[0]['photoUrl'],
        userNameOfUser: userDbController.userData[0]['userName'],
        nameOfUser: userDbController.userData[0]['name'],
        userLocationOfUser: userDbController.userData[0]['location'],
      ),
    );
    captionController.clear();
    locationController.clear();
    imagePath.value = '';
  }

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemark[0];

    String formatedAdress = "${place.locality}, ${place.country}";
    locationController.text = formatedAdress;
  }

  void getImageFromDevice(ImageSource source) async {
    var imagePicker = await ImagePicker().pickImage(source: source);

    if (imagePicker != null) {
      final imageFile = File(imagePicker.path);

      imagePath.value = imagePicker.path;

      var snapshot = await storage
          .ref()
          .child('userPosts/${imagePicker.name}')
          .putFile(imageFile);

      downloadUrl = await snapshot.ref.getDownloadURL();

      Get.snackbar(
        'Success',
        'Image Selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Image Not Selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    }
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
