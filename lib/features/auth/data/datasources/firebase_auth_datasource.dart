import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ballot_eye/features/auth/data/datasources/auth_datasource.dart';
import 'package:ballot_eye/features/auth/domain/entities/app_user.dart';
import 'package:ballot_eye/features/auth/data/models/app_user_model.dart';
import 'package:ballot_eye/core/error/failures.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthDatasource implements AuthDatasource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FirebaseAuthDatasource(this._auth, this._firestore);

  @override
  Future<AppUser?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) return null;
    
    final doc = await _firestore.collection('users').doc(user.uid).get();
    if (!doc.exists) return null;
    
    return AppUserModel.fromJson(doc.data()!).toEntity();
  }

  @override
  Future<AppUser> signInWithEmail(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      final doc = await _firestore.collection('users').doc(credential.user!.uid).get();
      if (!doc.exists) {
        throw const AuthFailure('User profile not found in Firestore');
      }
      
      return AppUserModel.fromJson(doc.data()!).toEntity();
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(e.message ?? 'Authentication failed', e.code);
    } catch (e) {
      throw AuthFailure(e.toString());
    }
  }

  @override
  Future<AppUser> signUpWithEmail(String email, String password, String name, String role) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      final userModel = AppUserModel(
        id: credential.user!.uid,
        email: email,
        name: name,
        role: role,
        createdAt: DateTime.now(),
      );
      
      await _firestore.collection('users').doc(credential.user!.uid).set(userModel.toJson());
      
      return userModel.toEntity();
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(e.message ?? 'Registration failed', e.code);
    } catch (e) {
      throw AuthFailure(e.toString());
    }
  }

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  Stream<AppUser?> authStateChanges() {
    return _auth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (!doc.exists) return null;
      return AppUserModel.fromJson(doc.data()!).toEntity();
    });
  }

  @override
  Future<void> updateFcmToken(String userId, String token) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'fcmToken': token,
        'lastTokenUpdate': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      debugPrint('Error updating FCM token: $e');
    }
  }
}
