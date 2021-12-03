// ignore_for_file: must_be_immutable

import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  String userName;
  String userUserName;
  String userImageUrl;

  SearchResult({
    Key? key,
    required this.userName,
    required this.userUserName,
    required this.userImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Container(
        color: const Color(0xffe7edeb),
        height: MediaQuery.of(context).size.height / 11,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(userImageUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    userName,
                    style: Env.textStyles.title.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '@$userUserName',
                    style: Env.textStyles.labelText.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
