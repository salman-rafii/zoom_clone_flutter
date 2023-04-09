import 'package:flutter/material.dart';
import 'package:zoom_clone_flutter/widgets/custom_button.dart';
import 'package:zoom_clone_flutter/widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            text: 'Start or join a meeting',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          CustomButton(
            text: "Login",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
