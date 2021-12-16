import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CommentDbController extends GetxController {
  CollectionReference commetsRef =
      FirebaseFirestore.instance.collection('comments');

  Future<void> addComment({
    required String comment,
    required String userId,
    required String postId,
    required String userName,
    required String userImageUrl,
    required DateTime dateTime,
  }) async {
    await commetsRef.doc(postId).collection('comments').add({
      'comment': comment,
      'userId': userId,
      'postId': postId,
      'userName': userName,
      'timestamp': dateTime,
      'userImageUrl': userImageUrl,
    });
  }

  int numnerOfComments = 0;

  Future<int> getComment({required String postId}) async {
    QuerySnapshot snapshot =
        await commetsRef.doc(postId).collection("comments").get();
    return snapshot.docs.length;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
