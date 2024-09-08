import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proposals/models/item_bloc/items_bloc.dart';
import 'package:proposals/models/item_bloc/items_state.dart';

class ItemBlocProviderBuilder<T, P> {
  late ItemBloc<T, P> Function(BuildContext) bloc;
  late Widget Function(T) onItemLoaded;
  late Widget Function() onLoading;
  late Widget Function(String) onError;

  ItemBlocProviderBuilder<T, P> setBloc(ItemBloc<T, P> Function(BuildContext) bloc) {
    this.bloc = bloc;
    return this;
  }

  ItemBlocProviderBuilder<T, P> setOnItemLoaded(Widget Function(T) onItemLoaded) {
    this.onItemLoaded = onItemLoaded;
    return this;
  }

  ItemBlocProviderBuilder<T, P> setOnLoading(Widget Function() onLoading) {
    this.onLoading = onLoading;
    return this;
  }

  ItemBlocProviderBuilder<T, P> setOnError(Widget Function(String) onError) {
    this.onError = onError;
    return this;
  }

  Widget build() {
    return BlocProvider(
      create: (context) => bloc.call(context),
      child: BlocBuilder<ItemBloc<T, P>, ItemState<T>>(
        builder: (context, state) {
          if (state is ItemLoaded<T>) {
            return onItemLoaded(state.item!);
          } else if (state is ItemError<T>) {
            return onError(state.message);
          } else {
            return onLoading();
          }
        },
      ),
    );
  }
}
