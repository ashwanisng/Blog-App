import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:flutter/material.dart';

class NoSearchResult extends StatelessWidget {
  const NoSearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/14_No Search Results.png",
      fit: BoxFit.cover,
    );
  }
}
