import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CreatePostHeader extends StatelessWidget {
  final String image;
  final String name;
  final String userName;

  const CreatePostHeader({
    Key? key,
    required this.image,
    required this.name,
    required this.userName,
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
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(image),
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
              name,
              style: Env.textStyles.title,
            ),
            Text(
              userName,
              style: Env.textStyles.labelText,
            ),
          ],
        ),
      ],
    );
  }
}
