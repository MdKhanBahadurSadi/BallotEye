import 'package:ballot_eye/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  Future<AppUser?> getCurrentUser();
  Future<AppUser> signInWithEmail(String email, String password);
  Future<AppUser> signUpWithEmail({
    required String email, 
    required String password, 
    required String name, 
    required String role
  });
  Future<void> signOut();
  Stream<AppUser?> authStateChanges();
  Future<void> updateFcmToken(String userId, String token);
}
