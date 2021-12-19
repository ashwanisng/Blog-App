// ignore_for_file: unnecessary_overrides

import 'package:blog_app/app/data/model/post.dart';
import 'package:blog_app/app/data/service/network_controller.dart';
import 'package:blog_app/app/global/firebase/database/post_db.dart';
import 'package:blog_app/app/global/firebase/database/user_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CreatePostController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  PostService postService = Get.find<PostService>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController captionController = TextEditingController();

  Uuid uuid = const Uuid();

  UserDbController userDbController = Get.find<UserDbController>();
  NetworkController networkController = Get.find<NetworkController>();

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
        userLocationOfUser: userDbController.userData[0]['location'],
      ),
    );
    titleController.clear();
    descriptionController.clear();
    contentController.clear();
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
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
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

    print(formatedAdress);
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
