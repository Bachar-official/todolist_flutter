import 'package:flutter/material.dart';

class UntilPicker extends StatelessWidget {
  final DateTime? doUntil;
  final void Function(DateTime?) onChange;
  const UntilPicker({super.key, required this.doUntil, required this.onChange});

  @override
  Widget build(BuildContext context) {
    Future<DateTime?> onChangeDate() => showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 36500),
          ),
        );

    return GestureDetector(
      onTap: () {
        onChangeDate().then(onChange);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Сделать до'),
              Switch(
                value: doUntil != null,
                onChanged: (value) {
                  if (!value) {
                    onChange(null);
                  } else {
                    onChangeDate().then(onChange);
                  }
                },
              ),
            ],
          ),
          Visibility(
            visible: doUntil != null,
            child: Text(
              doUntil.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
