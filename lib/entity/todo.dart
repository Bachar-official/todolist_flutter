import 'package:todolist_flutter/entity/hex_color.dart';
import 'package:todolist_flutter/entity/importance.dart';
import 'package:flutter/material.dart';
import 'package:todolist_flutter/utils/get_device_id.dart';
import 'package:uuid/v4.dart';
import 'dart:convert';

class Todo {
  final bool done;
  final String text;
  final Importance importance;
  final DateTime? deadline;
  final String id;
  final Color? color;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String lastUpdatedBy;

  const Todo({
    required this.done,
    required this.text,
    required this.importance,
    required this.deadline,
    required this.id,
    required this.color,
    required this.createdAt,
    required this.lastUpdatedBy,
    required this.updatedAt,
  });

  Todo.initial(
      {required bool crDone,
      required String crText,
      required Importance crImportance,
      DateTime? crDeadline,
      Color? crColor})
      : id = const UuidV4().generate(),
        createdAt = DateTime.now(),
        updatedAt = DateTime.now(),
        lastUpdatedBy = getDeviceId(),
        done = crDone,
        text = crText,
        importance = crImportance,
        deadline = crDeadline,
        color = crColor;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        done: json['done'],
        text: json['text'],
        importance: Importance.fromString(json['importance']),
        deadline: json['deadline'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['deadline'])
            : null,
        createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt']),
        lastUpdatedBy: json['lastUpdatedBy'],
        color: json['color'] != null ? HexColor.fromHex(json['color']) : null,
      );

      factory Todo.fromDb(Map<String, Object?> object) => Todo(
        id: object['id'] as String,
        done: object['done'] as int == 1,
        text: object['text'] as String,
        importance: Importance.fromString(object['importance'] as String),
        deadline: object['deadline'] != null
            ? DateTime.fromMillisecondsSinceEpoch(object['deadline'] as int)
            : null,
        createdAt: DateTime.fromMillisecondsSinceEpoch(object['createdAt'] as int),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(object['updatedAt'] as int),
        lastUpdatedBy: object['lastUpdatedBy'] as String,
        color: object['color'] != null ? HexColor.fromHex(object['color'] as String) : null,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'done': done,
        'text': text,
        'importance': importance.name,
        'deadline': deadline?.millisecondsSinceEpoch,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'updatedAt': updatedAt.millisecondsSinceEpoch,
        'lastUpdatedBy': lastUpdatedBy,
        'color': color?.toHex(),
      };

  String toJson() => jsonEncode({
        'element': toMap(),
      });

  Todo copyWith({
    bool? done,
    String? text,
    Importance? importance,
    DateTime? deadline,
    bool nullDeadline = false,
    bool nullColor = false,
    String? id,
    Color? color,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? lastUpdatedBy,
  }) {
    return Todo(
      done: done ?? this.done,
      text: text ?? this.text,
      importance: importance ?? this.importance,
      deadline: nullDeadline ? null : deadline ?? this.deadline,
      id: id ?? this.id,
      color: nullColor ? null : color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedBy: lastUpdatedBy ?? this.lastUpdatedBy,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() => 'Todo:\n'
      'id: $id\n'
      'done: $done\n'
      'text: $text\n'
      'importance: $importance\n'
      'deadline: $deadline\n'
      'createdAt: $createdAt\n'
      'updatedAt: $updatedAt\n'
      'lastUpdatedBy: $lastUpdatedBy\n'
      'color: $color\n';
}
