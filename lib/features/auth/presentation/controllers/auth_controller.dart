import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ballot_eye/features/auth/domain/entities/app_user.dart';
import 'package:ballot_eye/core/providers/firebase_providers.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Stream<AppUser?> build() {
    return ref.watch(authRepositoryProvider).authStateChanges();
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => 
        ref.read(authRepositoryProvider).signInWithEmail(email, password));
  }

  Future<void> register(String email, String password, String name, String role) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => 
        ref.read(authRepositoryProvider).signUpWithEmail(
          email: email, 
          password: password, 
          name: name, 
          role: role
        ));
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    await ref.read(authRepositoryProvider).signOut();
  }
}
