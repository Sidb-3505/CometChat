import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import '../auth/login_screen.dart';
import '../navbar/bottom_navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /// to check the login status
    checkLoginStatus();
  }

  /// to check if user is already logged in
  void checkLoginStatus() async {
    /// waiting for CometChat session check
    User? user = await CometChat.getLoggedInUser();

    /// some delay, for smoother splash effect
    await Future.delayed(Duration(milliseconds: 500));

    /// if user is logged in
    if (user != null) {
      /// redirection to home screen if user exists
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => CometChatBottomNav()),
      );
    } else {
      /// redirection to login screen if user is not logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ), // You can customize this
      ),
    );
  }
}
