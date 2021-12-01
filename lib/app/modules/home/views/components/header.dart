import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 4),
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
          // const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "John Doe",
                style: Env.textStyles.title,
              ),
              Text("@johndoe", style: Env.textStyles.labelText),
            ],
          ),
          const SizedBox(width: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "2 days ago",
                style: Env.textStyles.labelText,
                // textAlign: TextAlign.right,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
