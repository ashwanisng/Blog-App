import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String caption;
  final String location;
  final String postUrl;
  final String userId;
  final bool isLiked;
  final dynamic likes;
  final int likeCount;
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
    required this.isLiked,
    required this.likes,
    required this.likeCount,
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
      isLiked: doc['isLiked'],
      likes: doc['likes'],
      likeCount: doc['likeCount'],
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
      'isLiked': isLiked,
      'likes': likes,
      'likeCount': likeCount,
      // 'comments': comments,
      'createdAt': createdAt,
      'imageUrlOfUser': imageUrlOfUser,
      'nameOfUser': nameOfUser,
      'userNameOfUser': userNameOfUser,
      'userLocationOfUser': userLocationOfUser,
    };
  }
}
