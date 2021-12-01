import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_bar_bloc/cubit/search_bar_cubit.dart';

/// {@template search_bar}
///
/// Custom widget allowing to build a SearchBar with state handled by bloc
/// {@endtemplate}
class SearchBar extends StatelessWidget {
  /// Used to set a hint text on the search bar. Default is "Search..."
  final String hintText;

  ///leading text for the search bar. Default is "Search..."
  final Text leading;

  /// used to set a specific keyboard type. Default type is name
  final TextInputType keyboardType;

  /// used to change the search icon. Default is [Icons.search]
  final Icon searchIcon;

  /// used to change the cancel icon. Default is [Icons.cancel]
  final Icon cancelIcon;

  const SearchBar({
    Key? key,
    this.hintText = "Search...",
    this.leading = const Text("Search..."),
    this.keyboardType = TextInputType.name,
    this.searchIcon = const Icon(Icons.search),
    this.cancelIcon = const Icon(Icons.cancel)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SearchBarCubit>().state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        state.isSearching ? BlocBuilder<SearchBarCubit, SearchBarState>(
          buildWhen: (previous, current) => previous.content != current.content,
          builder: (context, state) {
            return Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: TextField(
                  key: const Key('searchBar_contentInput_textField'),
                  onChanged: (content) => context.read<SearchBarCubit>().contentChanged(content),
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none
                  ),
                )
            );
          },
        ) : leading,
        IconButton(
            onPressed: () {
              context.read<SearchBarCubit>().switchIsSearching();
            },
            icon: state.isSearching ? cancelIcon : searchIcon
        )
      ],
    );
  }
}