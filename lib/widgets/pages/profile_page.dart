import 'package:flutter/material.dart';
import 'package:sound_bubble/utils/palette.dart';
import '../app.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.homePageBackground,
      child: Center(
        child: ElevatedButton(
          child: const Text("Log out"), 
          onPressed: () {
            appLogic.signOut();
          },
        ),
      ),
    );
  }
}