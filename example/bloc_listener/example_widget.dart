
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_bar_bloc/search_bar_bloc.dart';

class BlockBuilderExampleWidget extends StatelessWidget {
  const BlockBuilderExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBarCubit, SearchBarState>(
      listenWhen: (previous, current) => previous.content != current.content,
      listener: (context, state) {
        print("You are searching : ${state.content}");
      },
      child: Container(),
    );
  }

}