

import 'package:bloc/bloc.dart';
import 'package:proposals/models/listem_items_bloc/list_item_event.dart';
import 'package:proposals/models/listem_items_bloc/list_items_repository.dart';

import 'list_item_state.dart';

class ListItemBloc<T, P> extends Bloc<ListItemEvent<T, P>, ListItemState<T>> {
  
  final ListItemsRepository<T, P> repository;
  ListItemBloc({required this.repository}) : super(ListItemInitial<T>()) {
    on<LoadItems<T, P>>((event, emit) async {
      try {
        final P parameters = event.getParameters();
        final items = await repository.fetchItems(parameters);
        emit(ListItemLoaded<T>(items: items));
      } catch (e) {  
        emit(ListItemError<T>(message: e.toString()));
      }
    });

    on<SelectItem<T, P>>((event, emit) {
      if (state is ListItemLoaded<T>) {
        final currentState = state as ListItemLoaded<T>;
        emit(ListItemLoaded<T>(
          items: currentState.items,
          selectedItem: event.selectedItem,
        ));
      }
    });
  }

}
