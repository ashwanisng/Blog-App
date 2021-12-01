import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CreatePostHeader extends StatelessWidget {
  const CreatePostHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 4, top: 12),
          child: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            // width: double.infinity,
            child: const CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  "https://www.seti.org/sites/default/files/styles/original/public/2019-09/Zork%20alien%20head%20PPR.jpg?itok=T7eTYzCZ"),
              radius: 26,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "John Doe",
              style: Env.textStyles.title,
            ),
            Text(
              "@johndoe",
              style: Env.textStyles.labelText,
            ),
          ],
        ),
      ],
    );
  }
}
