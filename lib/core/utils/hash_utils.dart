import 'dart:io';
import 'package:crypto/crypto.dart';

class HashUtils {
  static Future<String> calculateSHA256(File file) async {
    final bytes = await file.readAsBytes();
    return sha256.convert(bytes).toString();
  }

  static Future<String> calculateSHA256String(String input) async {
    final bytes = List<int>.from(input.codeUnits);
    return sha256.convert(bytes).toString();
  }
}

