import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Importance {
  basic('basic'),
  low('low'),
  important('important');

  final String name;

  const Importance(this.name);

  factory Importance.fromString(String name) => Importance.values
      .firstWhere((el) => el.name.toLowerCase() == name.toLowerCase());

  @override
  String toString() => name;

  String getImportanceName(BuildContext context) {
    final localization = AppLocalizations.of(context);
    switch (this) {
      case Importance.low:
        return localization.importance_low;
      case Importance.important:
        return localization.importance_high;
      case Importance.basic:
      default:
        return localization.importance_basic;
    }
  }

  DropdownMenuItem<Importance> getDropdownItem(BuildContext context) {
    var name = getImportanceName(context);
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
