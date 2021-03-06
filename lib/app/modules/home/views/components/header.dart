import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String image;
  final String name;
  final String username;
  final String time;

  const Header({
    Key? key,
    required this.image,
    required this.name,
    required this.username,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 4),
            child: Expanded(
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                // width: double.infinity,
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    image,
                  ),
                  radius: 26,
                ),
              ),
            ),
          ),
          // const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style:
                      Env.textStyles.text.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(username, style: Env.textStyles.labelText),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    time,
                    style: Env.textStyles.labelText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    // textAlign: TextAlign.right,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
