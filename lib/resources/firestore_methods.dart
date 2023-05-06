import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoom_clone_flutter/resources/firebase_collections.dart';
import 'package:zoom_clone_flutter/resources/firebase_methods.dart';

class FirestoreMethods {
  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory => firestore
      .collection(FirebaseConstants.usersCollection)
      .doc(firebaseAuth.currentUser!.uid)
      .collection(FirebaseConstants.meetingsCollection)
      .snapshots();
  void addToMeetingHistory(String meetingName) async {
    try {
      await firestore
          .collection(FirebaseConstants.usersCollection)
          .doc(firebaseAuth.currentUser!.uid)
          .collection(FirebaseConstants.meetingsCollection)
          .add({'meetingName': meetingName, 'createdAt': DateTime.now()});
    } catch (e) {
      log(e.toString());
    }
  }
}
