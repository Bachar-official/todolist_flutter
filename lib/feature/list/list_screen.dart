import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/components/todo_card.dart';
import 'package:todolist_flutter/feature/list/list_state.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ListState>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo List'),
          ),
          body: ListView.builder(
            itemBuilder: (ctx, index) => TodoCard(todo: state.list[index]),
            itemCount: state.list.length,
          ),
        );
      },
    );
  }
}
