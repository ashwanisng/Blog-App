import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FollowerFollowingDb extends GetxController {
  var isFollowing = false.obs;

  CollectionReference followingRef =
      FirebaseFirestore.instance.collection('following');

  CollectionReference followerRef =
      FirebaseFirestore.instance.collection('followers');

  Future<void> addFollowing({
    required String currentUserId,
    required String followingId,
  }) async {
    await followingRef
        .doc(currentUserId)
        .collection('following')
        .doc(followingId)
        .set({'id': followingId});
  }

  Future<void> addFollower({
    required String currentUserId,
    required String followerId,
  }) async {
    await followerRef
        .doc(currentUserId)
        .collection('followers')
        .doc(followerId)
        .set({'id': followerId});
  }

  Future<void> removeFollowing({
    required String currentUserId,
    required String followingId,
  }) async {
    await followingRef
        .doc(currentUserId)
        .collection('following')
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
        .collection('followers')
        .doc(followerId)
        .get()
        .then((value) {
      if (value.exists) {
        value.reference.delete();
      }
    });
  }
}
