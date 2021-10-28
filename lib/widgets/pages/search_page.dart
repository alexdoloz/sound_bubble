import 'package:flutter/material.dart';
import 'package:sound_bubble/utils/palette.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.homePageBackground,
      child: const Center(
        child: Text("Search"),
      ),
    );
  }
}