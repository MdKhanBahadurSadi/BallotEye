import 'package:flutter/foundation.dart';

class AppLogger {
  static void d(String message) {
    if (kDebugMode) {
      debugPrint('[DEBUG] $message');
    }
  }

  static void e(String message, [dynamic error, StackTrace? stackTrace]) {
    debugPrint('[ERROR] $message');
    if (error != null) debugPrint('Error Details: $error');
    if (stackTrace != null) debugPrint(stackTrace.toString());
  }
}

class AppAnalytics {
  static void logEvent(String name, [Map<String, dynamic>? parameters]) {
    // Placeholder for future Firebase Analytics or other services
    AppLogger.d('Analytics Event: $name, Params: $parameters');
  }

  static void setCurrentScreen(String screenName) {
    AppLogger.d('Analytics Screen: $screenName');
  }
}
