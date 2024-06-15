import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_flutter/feature/item/item_state.dart';

class ItemHolder extends StateNotifier<ItemState> {
  ItemHolder() : super(const ItemState.initial());
}
