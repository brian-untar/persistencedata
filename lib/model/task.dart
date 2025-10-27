class Task {
  int? id;
  String title;
  String description;
  bool isDone;

  Task({
    this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });

  // Konversi dari Map (SQLite) ke Object
  factory Task.fromMap(Map<String, dynamic> json) => Task(
    id: json['id'] as int?,
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    isDone: (json['isDone'] ?? 0) == 1,
  );

  // Konversi dari Object ke Map (untuk disimpan di SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone ? 1 : 0,
    };
  }
}
