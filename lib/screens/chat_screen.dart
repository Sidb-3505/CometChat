import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

class ChatScreen extends StatefulWidget {
  /// getting the desired user to chat with
  final User user;
  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// app bar
      appBar: CometChatMessageHeader(
        user: widget.user,
        showBackButton: true,
        hideVideoCallButton: false,
        hideVoiceCallButton: false,
      ),

      /// body
      body: SafeArea(
        child: Column(
          children: [
            /// to show all messages
            Expanded(child: CometChatMessageList(user: widget.user)),

            /// to show options
            CometChatMessageComposer(user: widget.user),
          ],
        ),
      ),
    );
  }
}
