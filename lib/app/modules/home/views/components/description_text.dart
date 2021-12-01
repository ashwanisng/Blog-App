import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String? description;

  const DescriptionText({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 4,
      ),
      child: Text(
        description ?? '',
        style: Env.textStyles.smallText,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
