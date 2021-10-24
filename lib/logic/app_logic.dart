import 'package:flutter/material.dart';
import 'package:sound_bubble/models/sign_in_data.dart';

abstract class AppLogic {
  final isLoggedIn = ValueNotifier(false);

  signIn(SignInData signInData);
  signOut();
}

class FakeAppLogic extends AppLogic {
  @override
  signIn(SignInData signInData) {
    print("Logged in with login ${signInData.login} and password ${signInData.password}");
    isLoggedIn.value = true;
  }

  @override
  signOut() {
    isLoggedIn.value = false;
  }
}