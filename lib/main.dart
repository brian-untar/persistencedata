import 'package:flutter/material.dart';
import 'package:persistencedata/screen/home_page.dart';
import 'package:sembast/sembast.dart';
import 'db/database.dart';
import 'screen/add_edit_list.dart';
import 'model/task.dart';
import 'screen/home_page.dart';
import 'db/sembast.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await SembastDB().database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Persistence Data',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
