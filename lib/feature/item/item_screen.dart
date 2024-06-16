import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter/components/icon_label_button.dart';
import 'package:todolist_flutter/components/until_picker.dart';
import 'package:todolist_flutter/entity/di.dart';
import 'package:todolist_flutter/entity/importance.dart';
import 'package:todolist_flutter/feature/item/item_holder.dart';
import 'package:todolist_flutter/feature/item/item_state.dart';
import 'package:todolist_flutter/utils/validators.dart';

final provider =
    StateNotifierProvider<ItemHolder, ItemState>((ref) => di.itemHolder);

const divider = Divider();

class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final manager = di.itemManager;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: manager.goBack,
          icon: const Icon(Icons.close),
        ),
        actions: [
          TextButton(
            onPressed: manager.save,
            child: const Text('СОХРАНИТЬ'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: manager.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: Validators.validateEmpty,
                  minLines: 3,
                  maxLines: 10,
                  controller: manager.descriptionC,
                  decoration: const InputDecoration(
                    hintText: 'Что нужно сделать...',
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                DropdownButtonFormField<Importance>(
                    value: state.importance,
                    iconSize: 0.0,
                    decoration: const InputDecoration(
                      labelText: 'Важность',
                      suffix: null,
                      border: InputBorder.none,
                    ),
                    items: Importance.values
                        .map((el) => DropdownMenuItem(
                              value: el,
                              child: Text(el.getImportanceName()),
                            ))
                        .toList(),
                    onChanged: manager.setImportance),
                divider,
                UntilPicker(
                  doUntil: state.doUntil,
                  onChange: manager.setDoUntil,
                ),
                divider,
                IconLabelButton(
                    label: 'Удалить',
                    onPressed: state.todo == null ? null : manager.remove),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
