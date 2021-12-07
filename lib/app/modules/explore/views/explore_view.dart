import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/explore/views/components/no_search.dart';
import 'package:blog_app/app/modules/explore/views/components/search_result.dart';
import 'package:blog_app/app/modules/explore/views/widgets/view_user_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:blog_app/app/modules/explore/controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextFormField(
          controller: controller.searchController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Search for users',
            filled: true,
            fillColor: const Color(0xffe7edeb),
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => controller.userDbController.searchUser(
                controller.searchController.text,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          onFieldSubmitted: (value) {},
        ),
      ),
      body: Obx(
        () => controller.userDbController.searchResultList.isEmpty
            ? const Center(child: NoSearchFound())
            : GestureDetector(
                onTap: () {
                  Get.to(
                    () => const ViewUser(),
                    arguments: {
                      'name': controller.userDbController.searchResultList[0]
                          ["name"],
                      'userName': controller
                          .userDbController.searchResultList[0]["userName"],
                      'image': controller.userDbController.searchResultList[0]
                          ["photoUrl"],
                      "bio": controller.userDbController.searchResultList[0]
                          ["bio"],
                      "uid": controller.userDbController.searchResultList[0]
                          ["uid"],
                    },
                  );

                  controller.followerFollowingDb.checkIfFollowing(
                      controller.userDbController.searchResultList[0]["uid"]);
                },
                child: SearchResult(
                  userUserName: controller.userDbController.searchResultList[0]
                      ["userName"],
                  userImageUrl: controller.userDbController.searchResultList[0]
                      ["photoUrl"],
                  userName: controller.userDbController.searchResultList[0]
                      ["name"],
                ),
              ),
      ),
    );
  }
}
