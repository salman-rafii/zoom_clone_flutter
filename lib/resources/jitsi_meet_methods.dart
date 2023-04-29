import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone_flutter/resources/auth_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
  }) async {
    try {
      // Define meetings options here
      var options = JitsiMeetingOptions(
        userAvatarUrl: _authMethods.user.photoURL,
        roomNameOrUrl: roomName,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        userDisplayName: _authMethods.user.displayName,
        userEmail: _authMethods.user.email,
      );
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
    } catch (e) {}
  }
}
