import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class SembastDB {
  static final SembastDB _singleton = SembastDB._internal();
  factory SembastDB() => _singleton;
  SembastDB._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _openDatabase();
    }
    return _database!;
  }

  Future<Database> _openDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, 'todo_app.db');
    return databaseFactoryIo.openDatabase(dbPath);
  }
}
