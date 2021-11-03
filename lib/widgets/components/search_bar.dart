import 'package:flutter/material.dart';

/// Generic search bar in app
class SearchBar extends StatelessWidget {
  final String hintText;

  const SearchBar({ 
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        icon: const Icon(Icons.search),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}