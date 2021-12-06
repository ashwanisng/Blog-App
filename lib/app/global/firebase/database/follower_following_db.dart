import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FollowerFollowingDb extends GetxController {
  var isFollowing = false.obs;

  CollectionReference followingRef =
      FirebaseFirestore.instance.collection('following');

  CollectionReference followerRef =
      FirebaseFirestore.instance.collection('followers');

  var followingList = [];

  var postList = [];

  var postCollection = [].obs;

  Future<void> getListOfUserFollowing() async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("following")
          .doc(_auth.currentUser!.uid)
          .collection("userFollowing")
          .get();

      followingList = snapshot.docs.map((doc) => doc.id).toList();

      for (var i = 0; i < followingList.length; i++) {
        var snapshot = await FirebaseFirestore.instance
            .collection('posts')
            .doc(followingList[i])
            .collection("userPosts")
            .orderBy('createdAt', descending: true)
            .get();

        postList += snapshot.docs.map((e) => (e.data())).toList();
      }

      postCollection.value = postList;

      print(postCollection.length);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addFollowing({
    required String currentUserId,
    required String followingId,
  }) async {
    await followingRef
        .doc(currentUserId)
        .collection('userFollowing')
        .doc(followingId)
        .set({});
  }

  Future<void> addFollower({
    required String currentUserId,
    required String followerId,
  }) async {
    await followerRef
        .doc(currentUserId)
        .collection('userFollowers')
        .doc(followerId)
        .set({});
  }

  Future<void> removeFollowing({
    required String currentUserId,
    required String followingId,
  }) async {
    await followingRef
        .doc(currentUserId)
        .collection('userFollowing')
        .doc(followingId)
        .get()
        .then((value) {
      if (value.exists) {
        value.reference.delete();
      }
    });
  }

  Future<void> removeFollower({
    required String currentUserId,
    required String followerId,
  }) async {
    await followerRef
        .doc(currentUserId)
        .collection('userFollowers')
        .doc(followerId)
        .get()
        .then((value) {
      if (value.exists) {
        value.reference.delete();
      }
    });
  }
}
