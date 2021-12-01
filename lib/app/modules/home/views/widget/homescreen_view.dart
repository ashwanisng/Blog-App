import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/home/controllers/home_controller.dart';
import 'package:blog_app/app/modules/home/views/components/description_text.dart';
import 'package:blog_app/app/modules/home/views/components/footer.dart';
import 'package:blog_app/app/modules/home/views/components/header.dart';
import 'package:blog_app/app/modules/home/views/components/topic_name.dart';
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 2.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(),
            TopicName(),
            SizedBox(height: 5),
            DescriptionText(),
            SizedBox(height: 5),
            Divider(),
            Footer(),
            Divider()
          ],
        ),
      ),
    );
  }
}
