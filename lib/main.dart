import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone_flutter/screens/home_screen.dart';
import 'package:zoom_clone_flutter/screens/login_screen.dart';
import 'package:zoom_clone_flutter/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(builder: (context, snapshot) => const Text("")),
      routes: {
        "/login": (context) => const LoginScreen(),
        "/home-screen": (context) => const HomeScreen(),
      },
    );
  }
}
