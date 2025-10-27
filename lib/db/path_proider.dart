import 'dart:io';
import 'package:path/path.dart';

/// Mengembalikan direktori penyimpanan aplikasi.
/// Pada Flutter, ini setara dengan getApplicationDocumentsDirectory().
Future<Directory> getApplicationDocumentsDirectory() async {
  final dir = Directory.current;
  final path = join(dir.path, 'data');
  final directory = Directory(path);
  if (!(await directory.exists())) {
    await directory.create(recursive: true);
  }
  return directory;
}
