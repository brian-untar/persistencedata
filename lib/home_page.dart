import 'package:flutter/material.dart';
import 'database.dart';
import 'add_edit_list.dart';
import 'task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = DBHelper.instance;
  List<Task> todos = [];

  void loadData() async {
    final data = await db.getTasks();
    setState(() {
      todos = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void deleteTodo(int id) async {
    await db.deleteTask(id);
    loadData();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Data berhasil dihapus")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To-Do List")),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final item = todos[index];
          return ListTile(
            title: Text(todos[index].title),
            subtitle: Text(todos[index].description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddTaskScreen(),
                      ),
                    );
                    loadData();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteTodo(todos[index].id!),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
          loadData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}