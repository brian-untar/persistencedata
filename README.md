# persistencedata

Proyek ini merupakan aplikasi To-Do List sederhana yang dikembangkan menggunakan Flutter dengan penyimpanan data lokal menggunakan SQLite melalui package sqflite. Aplikasi ini berfungsi untuk mencatat, menampilkan, mengedit, dan menghapus daftar tugas pengguna secara offline tanpa koneksi internet.

## Fitur Utama

1. Tambah Tugas (Add Task)
Pengguna dapat menambahkan tugas baru dengan judul dan deskripsi yang akan disimpan ke database lokal SQLite.

2. Tampilkan Daftar Tugas (Home Screen)
Semua tugas yang tersimpan akan ditampilkan pada halaman utama dalam bentuk daftar.
Tugas yang sudah selesai dapat ditandai (checked) dengan kotak centang.

3. Edit & Hapus Tugas
Pengguna dapat memperbarui isi tugas dengan menekan salah satu item, serta dapat menghapus tugas melalui ikon tempat sampah.

4. Penyimpanan Lokal (SQLite)
Semua data tugas disimpan secara persisten di database SQLite, sehingga tetap tersimpan meskipun aplikasi ditutup.

## Komponen Utama

1. main.dart → Menjalankan aplikasi dan memanggil halaman utama.
2. homescreen.dart → Menampilkan daftar tugas serta tombol tambah tugas.
3. addtask.dart → Form untuk menambah atau mengedit tugas.
4. task.dart → Model data yang merepresentasikan struktur tabel tasks.
5. database_helper.dart → Kelas helper yang mengatur koneksi dan operasi CRUD ke database SQLite.

