// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proposals/models/listem_items_bloc/list_item_bloc.dart';
import 'package:proposals/models/listem_items_bloc/list_item_state.dart';

class ListItemsBlocProvider<T, P> {}

class ListItemsBlocProviderBuilder<T, P> {

  late ListItemBloc<T, P> Function(BuildContext) bloc;
  late Widget Function(List<T>, T?) onListItemsLoaded;
  late Widget Function(List<T>, T?) onSelectedItem;
  Widget Function()? onInitial;
  late Widget Function() onError;

  ListItemsBlocProviderBuilder<T, P> setBloc(
      ListItemBloc<T, P> Function(BuildContext) bloc) {
    this.bloc = bloc;
    return this;
  }

  ListItemsBlocProviderBuilder<T, P> setOnSuccessful(Widget Function(List<T>, T?) onListItemsLoaded) {
    this.onListItemsLoaded = onListItemsLoaded;
    return this;
  }

  
  ListItemsBlocProviderBuilder<T, P> setOnInitial(Widget Function() onInitial) {
    this.onInitial = onInitial;
    return this;
  }

  ListItemsBlocProviderBuilder<T, P> setOnSelectedItem(Widget Function(List<T>, T?) onSelectedItem) {
    this.onSelectedItem = onSelectedItem;
    return this;
  }

  ListItemsBlocProviderBuilder<T, P> setOnError(Widget Function() onError) {
    this.onError = onError;
    return this;
  }
  


  /**
   * 
   */
  Widget build() {
    return BlocProvider(
      create: (context) => bloc.call(context),
      child: BlocBuilder<ListItemBloc<T, P>, ListItemState<T>>(
        builder: (context, state) {
          if (state is ListItemLoaded<T>) {
            return onListItemsLoaded(state.items, state.selectedItem);
          } else if (state is ListItemError<T>) {
            return onListItemsLoaded(state.items, state.selectedItem);
          } else if (state is ListItemInitial) {
            return onInitial != null ? onInitial!(): Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
