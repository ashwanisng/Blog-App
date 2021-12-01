import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:blog_app/app/modules/post/controllers/post_controller.dart';

class PostView extends GetView<PostController> {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.background,
      appBar: AppBar(
        title: const Text('Post'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            child: Text(
              'Post',
              style: Env.textStyles.title,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: Text(
              "Flutter is Google's framework launched in 2018 and designed for cross-platform development based on the DART programming language (originally called Dash), also created by Google. It allows developing an application only once for two platforms: iOS and Android. It also allows building web apps and offers alpha mode for Windows and Linux. Flutter is becoming more and more popular thanks to many instructions available online such as how to create a smooth flutter tutorials, from one of our Flutter developers.The framework was developed when Facebook's React Native ruled the market, and since then Flutter development has become known for simplifying the whole process. What’s more, over the last 3 years it has become a more preferred toolkit, used by 42% of developers, while React Native by only 38% (and dropping). Clearly it shows that Flutter cross-platform development has become more and more popular.",
              style: Env.textStyles.labelText,
            ),
          )
        ],
      ),
    );
  }
}
