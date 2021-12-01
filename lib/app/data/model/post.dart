import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String title;
  final String content;
  final String description;
  final String userId;
  final int likes;
  final int dislikes;
  // final int comments;
  final DateTime createdAt;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.description,
    required this.userId,
    required this.likes,
    required this.dislikes,
    // required this.comments,
    required this.createdAt,
  });

  factory PostModel.fromDocument(DocumentSnapshot doc) {
    return PostModel(
      id: doc['id'],
      title: doc['title'],
      content: doc['content'],
      description: doc['description'],
      userId: doc['userId'],
      likes: doc['likes'],
      dislikes: doc['dislikes'],
      // comments: doc['comments'],
      createdAt: doc['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'description': description,
      'userId': userId,
      'likes': likes,
      'dislikes': dislikes,
      // 'comments': comments,
      'createdAt': createdAt,
    };
  }
}
