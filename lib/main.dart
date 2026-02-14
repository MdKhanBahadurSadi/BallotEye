import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ballot_eye/app.dart';
import 'package:ballot_eye/core/services/firebase_initialization_service.dart';
import 'package:ballot_eye/firebase_options.dart';

void main() async {
  // Ensure Flutter engine is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase using the generated options file.
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // This is a critical error. The app likely cannot function without Firebase.
    // In a production app, you might want to show a specific error screen.
    debugPrint('Firebase initialization failed: $e');
  }

  // Create a ProviderContainer to initialize services before the app runs.
  final container = ProviderContainer();

  // Perform any other essential async initialization.
  await InitializationService.initialize(container);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const BallotEyeApp(),
    ),
  );
}
