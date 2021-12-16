import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_bar_state.dart';

/// {@template search_bar_cubit}
///
/// {@endtemplate}
class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(const SearchBarState());

  /// called when the [content] of the search bar changed
  void contentChanged(String content) {
    emit(state.copyWith(content: content));
  }

  void switchIsSearching() {
    emit(SearchBarState(isSearching: !state.isSearching));
  }
}
