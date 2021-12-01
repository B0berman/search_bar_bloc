part of 'search_bar_cubit.dart';

/// {@template search_bar_state}
///
/// {@endtemplate}
class SearchBarState extends Equatable {
  const SearchBarState({
    this.content = "",
    this.isSearching = false,
  });

  /// String containing users entry in the search_bar
  final String content;

  /// set to true when user clicks on the search icon
  /// set to false when user clicks on the cancel icon
  final bool isSearching;

  SearchBarState copyWith({String? content, bool? isSearching}) {
    return SearchBarState(
        content: content ?? this.content,
        isSearching: isSearching ?? this.isSearching);
  }

  @override
  List<Object> get props => [content, isSearching];
}
