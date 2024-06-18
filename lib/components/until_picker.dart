import 'package:flutter/material.dart';
import 'package:todolist_flutter/constants/palette.dart';
import 'package:todolist_flutter/utils/readable_date.dart';

class UntilPicker extends StatelessWidget {
  final DateTime? doUntil;
  final void Function(DateTime?) onChange;
  const UntilPicker({super.key, required this.doUntil, required this.onChange});

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
              getReadableDate(doUntil),
              style: TextStyle(
                  color: brightness == Brightness.dark
                      ? DarkPalette.blue
                      : LightPalette.blue),
            ),
          ),
        ],
      ),
    );
  }
}
