<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

#### SearchBar with Bloc

This package a SearchBar with Bloc state management.

The purpose of this package is to give an easy way to implement a search bar in a stateless widget.

## Features

The composition of the search bar is customizable and more parameters will be handled in the future.

## Getting started

If you're not familiar with bloc state management and the flutter_bloc package here are the resources you need :

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [bloc](https://pub.dev/packages/bloc)
- [equatable](https://pub.dev/packages/equatable)

## Usage

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

