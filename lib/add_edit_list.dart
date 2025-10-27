import 'package:flutter/material.dart';
import 'database.dart';
import 'task.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? task;
  const AddTaskScreen({super.key, this.task});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descController.text = widget.task!.description;
    }
  }

  Future<void> _saveTask() async {
    print("✅ Tombol simpan ditekan!");

    if (!_formKey.currentState!.validate()) {
      print("❌ Validasi gagal: judul kosong");
      return; // Hentikan fungsi jika validasi gagal
    }

    final task = Task(
      id: widget.task?.id,
      title: _titleController.text,
      description: _descController.text,
      // Asumsi model Task menggunakan tipe bool, jika tidak, sesuaikan
      isDone: widget.task?.isDone ?? false,
    );

    // PERBAIKAN UTAMA: Menggunakan try-catch untuk menjamin eksekusi pop
    try {
      if (widget.task == null) {
        print("🟢 Tambah tugas baru");
        await DBHelper.instance.addTask(task);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tugas berhasil ditambahkan")),
        );
      } else {
        print("🟡 Update tugas id: ${task.id}");
        await DBHelper.instance.updateTask(task);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tugas berhasil diperbarui")),
        );
      }

      // Pastikan context masih aktif sebelum pop
      if (!mounted) return;
      // Berhasil: kembali dan kirim nilai 'true'
      Navigator.pop(context, true);

    } catch (e) {
      // Error: Tangani kegagalan database
      print("❌ ERROR DATABASE: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal menyimpan tugas. Error: $e"),
          backgroundColor: Colors.red,
        ),
      );

      // Walaupun gagal, kembali dan kirim nilai 'false'
      if (!mounted) return;
      Navigator.pop(context, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.task == null ? "Tambah Tugas" : "Edit Tugas"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: "Judul"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Judul tidak boleh kosong" : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _descController,
                    decoration: const InputDecoration(labelText: "Deskripsi"),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text("Simpan"),
                    onPressed: _saveTask,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
        ),
    );
  }
}