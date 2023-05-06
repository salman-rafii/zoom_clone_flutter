// ignore_for_file: avoid_print

import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone_flutter/resources/auth_methods.dart';
import 'package:zoom_clone_flutter/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      String name;
      // Define meetings options here
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(
        userAvatarUrl: _authMethods.user.photoURL,
        roomNameOrUrl: roomName,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        userDisplayName: name,
        userEmail: _authMethods.user.email,
      );
      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeetWrapper.joinMeeting(
        options: options,
        listener: JitsiMeetingListener(
          onConferenceWillJoin: (url) =>
              print("onConferenceWillJoin: url: $url"),
          onConferenceJoined: (url) => print("onConferenceJoined: url: $url"),
          onConferenceTerminated: (url, error) =>
              print("onConferenceTerminated: url: $url, error: $error"),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
