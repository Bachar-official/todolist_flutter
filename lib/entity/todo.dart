class Todo {
  final bool isCompleted;
  final DateTime createdAt;
  final String title;
  final String description;

  const Todo(
      {required this.createdAt,
      required this.title,
      required this.description,
      required this.isCompleted});
}
