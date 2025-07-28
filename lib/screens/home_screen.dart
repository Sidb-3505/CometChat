import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// to show conversation list of the added users
    return CometChatConversations(
      onItemTap: (Conversation conversation) {
        User user = conversation.conversationWith as User;

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ChatScreen(user: user)),
        );
      },
    );
  }
}
