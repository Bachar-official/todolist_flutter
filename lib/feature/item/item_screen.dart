import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter/components/icon_label_button.dart';
import 'package:todolist_flutter/components/until_picker.dart';
import 'package:todolist_flutter/entity/di.dart';
import 'package:todolist_flutter/entity/importance.dart';
import 'package:todolist_flutter/feature/item/item_holder.dart';
import 'package:todolist_flutter/feature/item/item_state.dart';
import 'package:todolist_flutter/utils/validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final provider =
    StateNotifierProvider<ItemHolder, ItemState>((ref) => di.itemHolder);

const divider = Divider();

class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final manager = di.itemManager;
    final localization = AppLocalizations.of(context);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) =>
          FadeTransition(opacity: animation, child: child),
      child: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: manager.goBack,
                  icon: const Icon(Icons.close),
                ),
                actions: [
                  TextButton(
                    onPressed: manager.save,
                    child: Text(localization.save.toUpperCase()),
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
                          decoration: InputDecoration(
                            hintText: localization.what_should_be_done,
                            filled: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        DropdownButtonFormField<Importance>(
                            value: state.importance,
                            iconSize: 0.0,
                            decoration: InputDecoration(
                              labelText: localization.importance,
                              suffix: null,
                              border: InputBorder.none,
                            ),
                            items: Importance.values
                                .map((el) => el.getDropdownItem(context))
                                .toList(),
                            onChanged: manager.setImportance),
                        divider,
                        UntilPicker(
                          doUntil: state.deadline,
                          onChange: manager.setDoUntil,
                        ),
                        divider,
                        IconLabelButton(
                            label: localization.delete,
                            onPressed:
                                state.todo == null ? null : manager.remove),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
