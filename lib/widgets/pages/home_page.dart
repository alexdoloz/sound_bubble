import 'package:flutter/material.dart';
import 'package:sound_bubble/utils/palette.dart';

// TODO: Убрать
var labelStyle = TextStyle(
  color: Colors.white,
  fontSize: 54.0,
);

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.homePageBackground,
      child: Center(
        child: Text("Home", style: labelStyle,),
      ),
    );
  }
}