import 'package:ballot_eye/features/auth/domain/entities/app_user.dart';

abstract class AuthDatasource {
  Future<AppUser?> getCurrentUser();
  Future<AppUser> signInWithEmail(String email, String password);
  Future<AppUser> signUpWithEmail(String email, String password, String name, String role);
  Future<void> signOut();
  Stream<AppUser?> authStateChanges();
  Future<void> updateFcmToken(String userId, String token);
}
