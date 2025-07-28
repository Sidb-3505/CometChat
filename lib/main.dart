import 'package:comet_chat/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:cometchat_calls_uikit/cometchat_calls_uikit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'config/demo_users.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Load .env file
  await dotenv.load(fileName: ".env");

  /// Request permissions
  await _requestPermissions();

  /// Initialize CometChat
  await _initializeCometChat();
  runApp(MyApp());
}

/// To request necessary permissions
Future<void> _requestPermissions() async {
  await [
    Permission.camera,
    Permission.microphone,
    Permission.notification,
  ].request();
}

/// for setting up cometchat UI kit
Future<void> _initializeCometChat() async {
  UIKitSettings uiKitSettings =
      (UIKitSettingsBuilder()
            ..subscriptionType = CometChatSubscriptionType.allUsers
            ..autoEstablishSocketConnection = true
            ..region = AuthDetails.region
            ..appId = AuthDetails.appId
            ..authKey = AuthDetails.authKey
            ..extensions = CometChatUIKitChatExtensions.getDefaultExtensions()
            ..callingExtension = CometChatCallingExtension()
            ..aiFeature = [
              //AISmartRepliesExtension(),
              //AIConversationStarterExtension(),
              //AIAssistBotExtension(),
              AIConversationSummaryExtension(), // Conversation Summary
            ])
          .build();

  await CometChatUIKit.init(
    uiKitSettings: uiKitSettings,
    onSuccess: (msg) => print("CometChat Initialized Successfully"),
    onError: (err) => print("CometChat Initialization Error: $err"),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CometChat Call Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: CallNavigationContext.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
