import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String caption;
  final String location;
  final String postUrl;
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
    required this.caption,
    required this.location,
    required this.postUrl,
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
      caption: doc['caption'],
      location: doc['location'],
      postUrl: doc['postUrl'],
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
      'caption': caption,
      'location': location,
      'postUrl': postUrl,
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
