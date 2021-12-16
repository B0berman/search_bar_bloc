## Bloc Provider Example

Here is a quick example of how to implement the search bar with a BlocProvider.

```dart
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBarCubit(),
      child: Column(
        children: [
          const SearchBar(hintText: "Search something..."),
          BlocBuilder<SearchBarCubit, SearchBarState>(
              buildWhen: (previous, current) => previous.content != current.content,
              builder: (context, state) {
                return Text("You are searching : ${state.content}");
              }),
        ],
      ),
    );
  }
```

## Bloc Provider Example

Here is a quick example of how to implement the search bar with a BlocListener.

```dart
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
```
