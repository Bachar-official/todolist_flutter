import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter/components/todo_card.dart';
import 'package:todolist_flutter/constants/palette.dart';
import 'package:todolist_flutter/constants/text_styles.dart';
import 'package:todolist_flutter/entity/di.dart';
import 'package:todolist_flutter/feature/list/list_holder.dart';
import 'package:todolist_flutter/feature/list/list_state.dart';

final provider =
    StateNotifierProvider<ListHolder, ListState>((ref) => di.listHolder);

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final manager = di.listManager;
    final bright = Theme.of(context).brightness;

    final doneStyle = TextStyles.button.copyWith(
      color: bright == Brightness.dark
          ? DarkPalette.labelTertiary
          : LightPalette.labelTertiary,
    );

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: false,
              pinned: true,
              floating: false,
              expandedHeight: 120,
              actions: [
                IconButton(
                  onPressed: manager.setOnlyCompleted,
                  icon: state.isCompleted
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
              ],
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('Мои дела'),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 73),
                  child: Text(
                    'Выполнено — ${manager.deps.repo.getFilteredList(true).length}',
                    style: doneStyle,
                  ),
                ),
              ),
            ),
            SliverList.builder(
                itemBuilder: (ctx, index) => TodoCard(
                      todo: state.list[index],
                      onGoToItemScreen: manager.goToItemScreen,
                      onCheckTodo: manager.checkTodo,
                      onRemoveTodo: manager.removeTodo,
                    ),
                itemCount: state.list.length),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  child: GestureDetector(
                    onTap: () => manager.goToItemScreen(null),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(73, 20, 25, 25),
                      child: Text('Новое', style: doneStyle),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => manager.goToItemScreen(null),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
