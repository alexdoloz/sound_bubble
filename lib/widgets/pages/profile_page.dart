import 'package:flutter/material.dart';
import 'package:sound_bubble/utils/palette.dart';

import '../app.dart';

// TODO: Убрать
var labelStyle = TextStyle(
  color: Colors.white,
  fontSize: 54.0,
);

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.homePageBackground,
      child: Center(
        child: ElevatedButton(
          child: Text("Log out"), 
          onPressed: () {
            appLogic.signOut();
          },
        ),
      ),
    );
  }
}