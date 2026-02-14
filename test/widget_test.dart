// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ballot_eye/app.dart';



import 'package:ballot_eye/features/auth/domain/repositories/auth_repository.dart';
import 'package:ballot_eye/core/providers/firebase_providers.dart';
import 'package:ballot_eye/features/auth/domain/entities/app_user.dart';
import 'package:ballot_eye/core/services/messaging_service.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Stream<AppUser?> authStateChanges() => Stream.value(null);
  @override
  Future<AppUser?> getCurrentUser() async => null;
  @override
  Future<AppUser> signInWithEmail(String email, String password) async => throw UnimplementedError();
  @override
  Future<AppUser> signUpWithEmail({required String email, required String password, required String name, required String role}) async => throw UnimplementedError();
  @override
  Future<void> signOut() async {}
  @override
  Future<void> updateFcmToken(String userId, String token) async {}
}

class MockMessagingService extends FirebaseMessagingService {
  MockMessagingService() : super(null as dynamic, null as dynamic);

  @override
  Future<void> initialize(String userId) async {}
  @override
  Future<void> subscribeToTopic(String topic) async {}
  @override
  Future<void> unsubscribeFromTopic(String topic) async {}
}



void main() {
  testWidgets('Application smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(MockAuthRepository()),
          messagingServiceProvider.overrideWithValue(MockMessagingService()),
          // Add other service overrides if they hit Firebase on init
        ],
        child: const BallotEyeApp(),
      ),
    );

    // Give it some time to settle
    await tester.pump(); // Pump initial frame
    await tester.pump(const Duration(milliseconds: 500)); // Wait for redirects

    // Verify that we start at the login screen (redirected from /).
    // The LoginScreen should display 'BallotEye'.
    expect(find.text('BallotEye'), findsOneWidget);
    
    // Check for the slogan
    expect(find.text('Transparency in every vote.'), findsOneWidget);

    // Verify that the login button is present
    expect(find.text('Sign In'), findsOneWidget);
  });
}



