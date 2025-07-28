import 'package:comet_chat/auth/login_screen.dart';
import 'package:cometchat_calls_uikit/cometchat_calls_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';

class Dialogs {
  /// to add another user to chat
  static void onAddUser(BuildContext context) {
    final TextEditingController uidController = TextEditingController();

    /// dialog box to perform actions
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Start Chat with User"),
        content: TextField(
          controller: uidController,
          decoration: InputDecoration(labelText: "Enter User UID"),
        ),
        actions: [
          /// cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),

          /// add user button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              CometChat.getUser(
                uidController.text.trim(),
                onSuccess: (user) {
                  /// moving to chatscreen with that user
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ChatScreen(user: user)),
                  );
                },
                onError: (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${e.message}"),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              );
            },
            child: Text(
              "Start Chat",
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  /// to logout of the app
  static void logout(BuildContext context) {
    /// Call CometChat logout and navigate to login
    CometChatUIKit.logout()
        .then((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        })
        .catchError((e) {
          print('Logout failed: $e');
        });
  }
}
