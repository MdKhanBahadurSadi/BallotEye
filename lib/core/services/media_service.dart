import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ballot_eye/core/utils/hash_utils.dart';

class MediaFile {
  final File file;
  final String path;
  final String fileName;
  final String type; // 'image' or 'video'
  final String hash;

  MediaFile({
    required this.file,
    required this.path,
    required this.fileName,
    required this.type,
    required this.hash,
  });
}

class MediaService {
  final ImagePicker _picker = ImagePicker();

  Future<MediaFile?> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image == null) return null;

    final file = File(image.path);
    final hash = await HashUtils.calculateSHA256(file);

    return MediaFile(
      file: file,
      path: image.path,
      fileName: image.name,
      type: 'image',
      hash: hash,
    );
  }

  Future<MediaFile?> pickVideo(ImageSource source) async {
    final XFile? video = await _picker.pickVideo(source: source);
    if (video == null) return null;

    final file = File(video.path);
    final hash = await HashUtils.calculateSHA256(file);

    return MediaFile(
      file: file,
      path: video.path,
      fileName: video.name,
      type: 'video',
      hash: hash,
    );
  }
}
