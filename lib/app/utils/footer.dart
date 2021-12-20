import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Footer extends StatelessWidget {
  final int? likes;
  // final int? dislikes;
  final int? comments;
  final Icon likeIcon;
  // final Icon dislikeIcon;

  final Function()? onLikeOnPressed;
  // final Function()? onDislikeOnPressed;
  final Function()? onCommentOnPressed;

  // ignore: use_key_in_widget_constructors
  const Footer({
    required this.likes,
    // required this.dislikes,
    required this.comments,
    required this.onLikeOnPressed,
    // required this.onDislikeOnPressed,
    required this.onCommentOnPressed,
    required this.likeIcon,
    // required this.dislikeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              IconButton(
                icon: likeIcon,
                onPressed: onLikeOnPressed,
              ),
              // SizedBox(width: ),
              Text(likes.toString()),
            ],
          ),
          // Row(
          //   children: [
          //     IconButton(
          //       icon: dislikeIcon,
          //       onPressed: onDislikeOnPressed,
          //     ),
          //     Text(dislikes.toString()),
          //   ],
          // ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: Env.colors.primaryGray,
                ),
                onPressed: onCommentOnPressed,
              ),
              Text(comments.toString()),
            ],
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.share,
              color: Env.colors.primaryGreen,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
