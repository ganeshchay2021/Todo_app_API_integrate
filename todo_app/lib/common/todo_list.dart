class TodoList {
  String id;
  String title;
  String description;
  bool isCompleted;
  DateTime createdAt;
  TodoList({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
  });

  factory TodoList.fromMap(Map<String, dynamic>map){
    return TodoList(id: map["_id"], title: map["title"], description: map["description"], isCompleted: map["completed"], createdAt: DateTime.parse(map["createdAt"]).toLocal());
  }
}
