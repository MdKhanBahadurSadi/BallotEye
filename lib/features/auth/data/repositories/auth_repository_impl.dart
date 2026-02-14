import 'package:ballot_eye/features/auth/domain/entities/app_user.dart';
import 'package:ballot_eye/features/auth/domain/repositories/auth_repository.dart';
import 'package:ballot_eye/features/auth/data/datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Future<AppUser?> getCurrentUser() => _datasource.getCurrentUser();

  @override
  Future<AppUser> signInWithEmail(String email, String password) => 
      _datasource.signInWithEmail(email, password);

  @override
  Future<AppUser> signUpWithEmail({
    required String email, 
    required String password, 
    required String name, 
    required String role
  }) => _datasource.signUpWithEmail(email, password, name, role);

  @override
  Future<void> signOut() => _datasource.signOut();

  @override
  Stream<AppUser?> authStateChanges() => _datasource.authStateChanges();

  @override
  Future<void> updateFcmToken(String userId, String token) => 
      _datasource.updateFcmToken(userId, token);
}
