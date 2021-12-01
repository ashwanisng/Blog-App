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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      userName: json['userName'],
      bio: json['bio'],
      location: json['location'],
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
