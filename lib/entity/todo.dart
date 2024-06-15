import 'package:todolist_flutter/entity/importance.dart';
import 'package:uuid/v4.dart';

class Todo {
  final bool isCompleted;
  final String description;
  final Importance importance;
  final DateTime? doUntil;
  final String uuid;

  const Todo({
    required this.isCompleted,
    required this.description,
    required this.importance,
    required this.doUntil,
    required this.uuid,
  });

  Todo copyWith(
      {bool? isCompleted,
      String? description,
      Importance? importance,
      DateTime? doUntil,
      bool nullDoUntil = false}) {
    return Todo(
      isCompleted: isCompleted ?? this.isCompleted,
      description: description ?? this.description,
      importance: importance ?? this.importance,
      doUntil: nullDoUntil ? null : doUntil ?? this.doUntil,
      uuid: uuid,
    );
  }

  @override
  String toString() => 'Todo:\n'
      'description: $description\n'
      'isCompleted: $isCompleted\n'
      'importance: $importance\n'
      'doUntil: $doUntil';
}
