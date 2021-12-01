import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:blog_app/app/modules/explore/controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExploreView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ExploreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
