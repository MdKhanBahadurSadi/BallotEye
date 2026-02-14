import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ballot_eye/features/auth/data/datasources/auth_datasource.dart';
import 'package:ballot_eye/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:ballot_eye/features/reports/data/datasources/reports_datasource.dart';
import 'package:ballot_eye/features/reports/data/datasources/firebase_reports_datasource.dart';
import 'package:ballot_eye/features/leaderboard/data/datasources/leaderboard_datasource.dart';
import 'package:ballot_eye/features/leaderboard/data/datasources/firebase_leaderboard_datasource.dart';
import 'package:ballot_eye/features/map/data/datasources/monitoring_area_datasource.dart';
import 'package:ballot_eye/core/services/storage_service.dart';
import 'package:ballot_eye/core/services/messaging_service.dart';
import 'package:ballot_eye/core/services/media_service.dart';
import 'package:ballot_eye/core/services/location_service.dart';
import 'package:ballot_eye/features/auth/domain/repositories/auth_repository.dart';
import 'package:ballot_eye/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ballot_eye/features/reports/domain/repositories/reports_repository.dart';
import 'package:ballot_eye/features/reports/data/repositories/reports_repository_impl.dart';
import 'package:ballot_eye/features/leaderboard/domain/repositories/leaderboard_repository.dart';
import 'package:ballot_eye/features/leaderboard/data/repositories/leaderboard_repository_impl.dart';

// Firebase Base Providers
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
final storageProvider = Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);
final messagingProvider = Provider<FirebaseMessaging>((ref) => FirebaseMessaging.instance);

// Datasource Providers
final authDatasourceProvider = Provider<AuthDatasource>((ref) {
  return FirebaseAuthDatasource(
    ref.watch(firebaseAuthProvider),
    ref.watch(firestoreProvider),
  );
});

final reportsDatasourceProvider = Provider<ReportsDatasource>((ref) {
  return FirebaseReportsDatasource(ref.watch(firestoreProvider));
});

final areasDatasourceProvider = Provider<MonitoringAreaDatasource>((ref) {
  return FirebaseMonitoringAreaDatasource(ref.watch(firestoreProvider));
});

// Repository Providers
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authDatasourceProvider));
});

final reportsRepositoryProvider = Provider<ReportsRepository>((ref) {
  return ReportsRepositoryImpl(
    ref.watch(reportsDatasourceProvider),
    ref.watch(storageServiceProvider),
    ref.watch(authRepositoryProvider),
  );
});

final leaderboardDatasourceProvider = Provider<LeaderboardDatasource>((ref) {
  return FirebaseLeaderboardDatasource(ref.watch(firestoreProvider));
});

final leaderboardRepositoryProvider = Provider<LeaderboardRepository>((ref) {
  return LeaderboardRepositoryImpl(ref.watch(leaderboardDatasourceProvider));
});

// Service Providers
final storageServiceProvider = Provider<FirebaseStorageService>((ref) {
  return FirebaseStorageService(ref.watch(storageProvider));
});

final messagingServiceProvider = Provider<FirebaseMessagingService>((ref) {
  return FirebaseMessagingService(
    ref.watch(messagingProvider),
    ref.watch(authRepositoryProvider),
  );
});

final mediaServiceProvider = Provider<MediaService>((ref) => MediaService());
final locationServiceProvider = Provider<LocationService>((ref) => LocationService());
