import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ballot_eye/features/map/domain/entities/monitoring_area.dart';
import 'package:ballot_eye/features/map/data/models/monitoring_area_model.dart';
import 'package:ballot_eye/core/error/failures.dart';

abstract class MonitoringAreaDatasource {
  Future<List<MonitoringArea>> getAreas();
  Stream<List<MonitoringArea>> watchAreas();
}

class FirebaseMonitoringAreaDatasource implements MonitoringAreaDatasource {
  final FirebaseFirestore _firestore;

  FirebaseMonitoringAreaDatasource(this._firestore);

  @override
  Future<List<MonitoringArea>> getAreas() async {
    try {
      final snapshot = await _firestore.collection('areas').get();
      return snapshot.docs
          .map((doc) => MonitoringAreaModel.fromJson(doc.data()).toEntity())
          .toList();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Stream<List<MonitoringArea>> watchAreas() {
    return _firestore.collection('areas').snapshots().map((snapshot) => snapshot.docs
        .map((doc) => MonitoringAreaModel.fromJson(doc.data()).toEntity())
        .toList());
  }
}
