import 'package:flutter/material.dart';
import 'package:todolist_flutter/entity/importance.dart';

@immutable
class ItemState {
  final Importance importance;
  final DateTime? doUntil;

  const ItemState({this.doUntil, required this.importance});

  const ItemState.initial()
      : importance = Importance.none,
        doUntil = null;

  ItemState copyWith(
      {Importance? importance, DateTime? doUntil, bool? nullDoUntil}) {
    return ItemState(
      importance: importance ?? this.importance,
      doUntil: nullDoUntil == true ? null : doUntil ?? this.doUntil,
    );
  }
}
