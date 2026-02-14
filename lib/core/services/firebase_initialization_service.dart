import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitializationService {
  static Future<void> initialize(WidgetRef ref) async {
    try {
      // NOTE: Firebase.initializeApp() must have been called in main() 
      // before this if we want to use ref.read immediately, 
      // or we can handle it here if it's not and we have the options.
      
      debugPrint('Global services initialized successfully');
    } catch (e) {
      debugPrint('Initialization error: $e');
      // Rethrow if critical
    }
  }
}
