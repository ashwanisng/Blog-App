import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:blog_app/app/modules/post/controllers/post_controller.dart';
import 'package:intl/intl.dart';

class PostView extends GetView<PostController> {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Env.colors.primaryBlue,
            ),
            onPressed: () {},
          ),
        ],
        iconTheme: IconThemeData(
          color: Env.colors.primaryBlue,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child:
                      Text(controller.title!, style: Env.textStyles.headline),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(DateFormat.yMMMMEEEEd().format(controller.date!),
                    style:
                        Env.textStyles.labelText.copyWith(color: Colors.grey)),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text(
                    controller.body!,
                    style: Env.textStyles.smallText,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
