import 'package:flutter/material.dart';
import 'package:zoom_clone_flutter/screens/home_screen.dart';
import 'package:zoom_clone_flutter/screens/login_screen.dart';
import 'package:zoom_clone_flutter/screens/video_call_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.route: (context) => const LoginScreen(),
  HomeScreen.route: (context) => const HomeScreen(),
  VideoCallScreen.route: (context) => const VideoCallScreen(),
};
