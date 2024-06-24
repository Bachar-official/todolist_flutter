import 'package:flutter/material.dart';

enum Importance {
  basic('basic'),
  low('low'),
  important('important');

  final String name;

  const Importance(this.name);

  factory Importance.fromString(String name) => Importance.values.firstWhere((el) => el.name.toLowerCase() == name.toLowerCase());

  @override
  String toString() => name;

  String getImportanceName() {
    switch (this) {
      case Importance.low:
        return 'Низкий';
      case Importance.important:
        return '!! Высокий';
      case Importance.basic:
      default:
        return 'Нет';
    }
  }

  DropdownMenuItem<Importance> getDropdownItem() {
    var name = getImportanceName();
    switch (this) {
      case Importance.low:
        return DropdownMenuItem(value: this, child: Text(name));
      case Importance.important:
        return DropdownMenuItem(
          value: this,
          child: Text(
            name,
            style: const TextStyle(color: Colors.red),
          ),
        );
      case Importance.basic:
      default:
        return DropdownMenuItem(value: this, child: Text(name));
    }
  }

  Widget getIcon() {
    switch (this) {
      case Importance.low:
        return const Icon(Icons.arrow_downward);
      case Importance.important:
        return const Text('!!', style: TextStyle(color: Colors.red));
      case Importance.basic:
      default:
        return const SizedBox.shrink();
    }
  }
}
