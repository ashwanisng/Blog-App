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
  final String imageUrlOfUser;
  final String nameOfUser;
  final String userNameOfUser;
  final String userLocationOfUser;

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
    required this.imageUrlOfUser,
    required this.nameOfUser,
    required this.userNameOfUser,
    required this.userLocationOfUser,
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
      imageUrlOfUser: doc['imageUrlOfUser'],
      nameOfUser: doc['nameOfUser'],
      userNameOfUser: doc['userNameOfUser'],
      userLocationOfUser: doc['userLocationOfUser'],
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
      'imageUrlOfUser': imageUrlOfUser,
      'nameOfUser': nameOfUser,
      'userNameOfUser': userNameOfUser,
      'userLocationOfUser': userLocationOfUser,
    };
  }
}
