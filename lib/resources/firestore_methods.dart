import 'dart:developer';

import 'package:zoom_clone_flutter/resources/firebase_collections.dart';
import 'package:zoom_clone_flutter/resources/firebase_methods.dart';

class FirestoreMethods {
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
