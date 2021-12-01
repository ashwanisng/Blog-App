import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Footer extends StatelessWidget {
  final int? likes;
  final int? dislikes;
  final int? comments;

  Footer({required this.likes, required this.dislikes, required this.comments});

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
                icon: Icon(
                  Icons.thumb_up_off_alt,
                  color: Env.colors.primaryBlue,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              // SizedBox(width: ),
              Text(likes.toString()),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.thumb_down_alt_outlined,
                  color: Colors.red,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              Text(dislikes.toString()),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: Env.colors.primaryGray,
                ),
                onPressed: () {
                  Get.back();
                },
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
