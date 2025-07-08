import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImageStorageHelper {
  static Future<String> saveImage(File image) async {
    final dir = await getApplicationDocumentsDirectory();
    final uuid = Uuid().v4();
    final fileName = 'img_$uuid.png';
    final savedImage = await image.copy('${dir.path}/$fileName');
    return savedImage.path;
  }

  static Future<File?> getImage(String path) async {
    final file = File(path);
    if (await file.exists()) {
      return file;
    }
    return null;
  }

  static Future<void> deleteImage(String path) async {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }
}
