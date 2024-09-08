import 'package:bloc/bloc.dart';
import 'package:proposals/models/item_bloc/items_event.dart';
import 'package:proposals/models/item_bloc/items_repository.dart';
import 'package:proposals/models/item_bloc/items_state.dart';

class ItemBloc<T, P> extends Bloc<ItemEvent<T, P>, ItemState<T>> {
  final ItemRepository<T, P> repository;

  ItemBloc({required this.repository}) : super(ItemInitial<T>()) {
    on<LoadItem<T, P>>((event, emit) async {
      try {
        final P parameters = event.getParameters();
        final item = await repository.fetchItem(parameters);
        emit(ItemLoaded<T>(item: item));
      } catch (e) {
        emit(ItemError<T>(message: e.toString()));
      }
    });

    on<UpdateItem<T, P>>((event, emit) async {
      if (state is ItemLoaded<T>) {
        try {
          await repository.updateItem(event.item);
          emit(ItemLoaded<T>(item: event.item));
        } catch (e) {
          emit(ItemError<T>(message: e.toString()));
        }
      }
    });
  }
}
