import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final String userName;
  final String bio;
  final String location;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.userName,
    required this.bio,
    required this.location,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      uid: doc['uid'],
      name: doc['name'],
      email: doc['email'],
      photoUrl: doc['photoUrl'],
      userName: doc['userName'],
      bio: doc['bio'],
      location: doc['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'userName': userName,
      'bio': bio,
      'location': location,
    };
  }
}
