import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter/app/routing.dart';
import 'package:todolist_flutter/components/todo_card.dart';
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

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: false,
              pinned: true,
              floating: false,
              expandedHeight: 120,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Мои дела'),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                child: Center(
                  child: Text('Scroll to see the SliverAppBar in effect.'),
                ),
              ),
            ),
            SliverList.builder(
                itemBuilder: (ctx, index) => TodoCard(todo: state.list[index]),
                itemCount: state.list.length),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: manager.goToItemScreen,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
