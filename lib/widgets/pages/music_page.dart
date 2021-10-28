import 'package:flutter/material.dart';
import 'package:sound_bubble/utils/palette.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.homePageBackground,
      child: const Center(
        child: Text("Music"),
      ),
    );
  }
}