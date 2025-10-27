import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'dart:io';

Future<Database> initSembastIO(String dbName) async {
  final directory = Directory.current;
  final path = join(directory.path, dbName);
  return databaseFactoryIo.openDatabase(path);
}
