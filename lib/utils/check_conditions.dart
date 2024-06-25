import 'package:todolist_flutter/entity/condition.dart';
import 'package:todolist_flutter/entity/condition_exception.dart';

void checkConditions(List<Condition> conditions) {
  for (var c in conditions) {
    if (c.condition) {
      throw ConditionException(c.message);
    }
  }
}

void checkCondition(Condition condition) {
  if (condition.condition) {
    throw ConditionException(condition.message);
  }
}