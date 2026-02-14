import 'package:ballot_eye/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _fcm;
  final AuthRepository _authRepository;

  FirebaseMessagingService(this._fcm, this._authRepository);

  Future<void> initialize(String userId) async {
    // Request permission
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
      
      // Get token and save it
      final token = await _fcm.getToken();
      if (token != null) {
        await _authRepository.updateFcmToken(userId, token);
      }
      
      // Listen for token refresh
      _fcm.onTokenRefresh.listen((newToken) {
        _authRepository.updateFcmToken(userId, newToken);
      });
      
      // Handle foreground messages
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
      
      // Handle background/terminated message taps
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    if (message.notification != null) {
      debugPrint('Notification: ${message.notification!.title} - ${message.notification!.body}');
    }
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    debugPrint('User tapped on a notification while app was in background!');
    // Implement navigation logic here based on message.data
  }

  Future<void> subscribeToTopic(String topic) async => await _fcm.subscribeToTopic(topic);
  Future<void> unsubscribeFromTopic(String topic) async => await _fcm.unsubscribeFromTopic(topic);
}
