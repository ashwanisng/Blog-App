import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:flutter/material.dart';

class TopicName extends StatelessWidget {
  final String? topicName;

  const TopicName({Key? key, @required this.topicName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 4,
      ),
      child: Flexible(
        child: Text(
          topicName!,
          style: Env.textStyles.descriptionText,
        ),
      ),
    );
  }
}
