import 'package:flutter/material.dart';

enum Importance {
  none,
  low,
  high;

  String getImportanceName() {
    switch (this) {
      case Importance.low:
        return 'Низкий';
      case Importance.high:
        return '!! Высокий';
      case Importance.none:
      default:
        return 'Нет';
    }
  }

  DropdownMenuItem<Importance> getDropdownItem() {
    var name = getImportanceName();
    switch (this) {
      case Importance.low:
        return DropdownMenuItem(value: this, child: Text(name));
      case Importance.high:
        return DropdownMenuItem(
          value: this,
          child: Text(
            name,
            style: const TextStyle(color: Colors.red),
          ),
        );
      case Importance.none:
      default:
        return DropdownMenuItem(value: this, child: Text(name));
    }
  }

  Widget getIcon() {
    switch (this) {
      case Importance.low:
        return const Icon(Icons.arrow_downward);
      case Importance.high:
        return const Text('!!', style: TextStyle(color: Colors.red));
      case Importance.none:
      default:
        return const SizedBox.shrink();
    }
  }
}
