
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_bar_bloc/search_bar_bloc.dart';

class BlockBuilderExampleWidget extends StatelessWidget {
  const BlockBuilderExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBarCubit(),
      child: Column(
        children: [
          const SearchBar(hintText: "Search movie by name"),
          BlocBuilder<SearchBarCubit, SearchBarState>(
              buildWhen: (previous, current) => previous.content != current.content,
              builder: (context, state) {
                return Text("You are searching : ${state.content}");
              }),
        ],
      ),
    );
  }

}