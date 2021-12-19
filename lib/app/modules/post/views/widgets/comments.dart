import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class Comments extends StatelessWidget {
  final String userName;
  final String avatarUrl;
  final String comment;
  final Timestamp timestamp;
  final String userId;

  const Comments({
    Key? key,
    required this.userName,
    required this.avatarUrl,
    required this.comment,
    required this.timestamp,
    required this.userId,
  }) : super(key: key);

  factory Comments.fromDocument(DocumentSnapshot doc) {
    return Comments(
      userName: doc['userName'],
      avatarUrl: doc['avatarUrl'],
      comment: doc['comment'],
      timestamp: doc['timestamp'],
      userId: doc['userId'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(avatarUrl),
          ),
          title: Text(comment),
          subtitle: Text(timeago.format(timestamp.toDate())),
        ),
        const Divider(),
      ],
    );
  }
}
