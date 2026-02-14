import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ballot_eye/core/error/failures.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage;

  FirebaseStorageService(this._storage);

  Future<String> uploadEvidence(String reportId, File file) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final ref = _storage.ref().child('evidence').child(reportId).child(fileName);
      final uploadTask = await ref.putFile(file);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      throw StorageFailure(e.toString());
    }
  }
}

class StorageFailure extends Failure {
  const StorageFailure(super.message);
}
