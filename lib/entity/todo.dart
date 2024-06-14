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

  Todo copyWith(
          {bool? isCompleted,
          DateTime? createdAt,
          String? title,
          String? description}) =>
      Todo(
          isCompleted: isCompleted ?? this.isCompleted,
          createdAt: createdAt ?? this.createdAt,
          title: title ?? this.title,
          description: description ?? this.description);
}
