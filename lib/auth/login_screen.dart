import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import '../navbar/bottom_navbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController uidController = TextEditingController();

  /// to show loading animation
  bool isLoading = false;

  /// to login with UID
  void loginWithUID(BuildContext context) async {
    String uid = uidController.text.trim();

    /// if nothing is entered
    if (uid.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please enter UID")));
      return;
    }

    /// to manage the loading animation
    setState(() => isLoading = true);

    /// logging the user in
    try {
      await CometChatUIKit.login(uid);

      /// successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CometChatBottomNav()),
      );
    } catch (e) {
      print("Login failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// app bar
      appBar: AppBar(
        title: Text(
          'ChatApp Login',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      /// body
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          children: [
            SizedBox(height: 40),

            /// showcase image
            Icon(
              Icons.chat_bubble_outline,
              size: 170,
              color: Colors.deepPurple,
            ),
            SizedBox(height: 90),

            /// form field to get user input
            buildTextField(uidController, "Enter UID"),
            SizedBox(height: 20),

            /// Login Button
            ElevatedButton.icon(
              icon: Icon(Icons.login),
              label: Text(
                "Login with UID",
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: isLoading ? null : () => loginWithUID(context),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// to build the text form field (in case of multiple)
  Widget buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
