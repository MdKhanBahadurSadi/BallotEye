import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ballot_eye/features/leaderboard/data/datasources/leaderboard_datasource.dart';
import 'package:ballot_eye/features/leaderboard/domain/entities/election_area.dart';
import 'package:ballot_eye/features/leaderboard/data/models/election_area_model.dart';
import 'package:ballot_eye/core/error/failures.dart';

class FirebaseLeaderboardDatasource implements LeaderboardDatasource {
  final FirebaseFirestore _firestore;

  FirebaseLeaderboardDatasource(this._firestore);

  @override
  Future<List<ElectionArea>> getLeaderboard() async {
    try {
      final snapshot = await _firestore.collection('areas')
          .orderBy('stats.score', descending: true)
          .limit(10)
          .get();
          
      return snapshot.docs
          .map((doc) => ElectionAreaModel.fromJson(doc.data()).toEntity())
          .toList();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<ElectionArea> getAreaStats(String areaId) async {
    try {
      final doc = await _firestore.collection('areas').doc(areaId).get();
      if (!doc.exists) throw const ServerFailure('Area not found');
      return ElectionAreaModel.fromJson(doc.data()!).toEntity();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
