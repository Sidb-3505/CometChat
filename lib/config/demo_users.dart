import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthDetails {
  /// auth details
  static String get region => dotenv.env['REGION']!;
  static String get appId => dotenv.env['APP_ID']!;
  static String get authKey => dotenv.env['AUTH_KEY']!;
}
