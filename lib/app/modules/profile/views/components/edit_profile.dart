import 'dart:io';

import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/profile/controllers/editprofile_controller.dart';
import 'package:blog_app/app/modules/profile/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends GetView<EditProfileController> {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: Env.textStyles.text.copyWith(color: Env.colors.primaryBlue),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.uploadUserDetails();
            },
            child: Text("Save",
                style: Env.textStyles.text
                    .copyWith(color: Env.colors.primaryBlue)),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Env.colors.primaryBlue),
      ),
      body: controller.userDb.isUserDataUploading.value == true
          ? const SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(children: [
                      Obx(
                        () => Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: controller.selectImagePath.value.isEmpty
                                ? Image.network(
                                    'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(controller.selectImagePath.value),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        // top: 0,
                        bottom: 10,
                        right: 10,
                        child: IconButton(
                          onPressed: () {
                            controller.selectProfileImage(ImageSource.gallery);
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 30,
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 20),
                    TextField(
                      controller: controller.nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xffe7edeb),
                        hintText: "Full Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller.usernameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xffe7edeb),
                        hintText: "@username",
                        prefixIcon: Icon(
                          CupertinoIcons.asterisk_circle,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xffe7edeb),
                        hintText: "Email",
                        prefixIcon: Icon(
                          CupertinoIcons.mail,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller.bioController,
                      keyboardType: TextInputType.text,
                      maxLines: 2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xffe7edeb),
                        hintText: "Bio",
                        prefixIcon: Icon(
                          Icons.description_outlined,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    TextField(
                      controller: controller.locationController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xffe7edeb),
                        hintText: "Location",
                        prefixIcon: Icon(
                          CupertinoIcons.location,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // CustomButton(
                    //   buttonText: "SAVE ADDRESS",
                    //   onPressed: () {},
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}
