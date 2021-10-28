import 'package:flutter/material.dart';
import 'package:sound_bubble/models/sign_in_data.dart';
import 'package:sound_bubble/models/sign_up_data.dart';

abstract class AppLogic {
  final isLoggedIn = ValueNotifier(false);

  signIn(SignInData signInData);
  signUp(SignUpData signUpData);
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

  @override
  signUp(SignUpData signUpData) {
    print("Signed up as ${signUpData.name} with login ${signUpData.login} and password ${signUpData.password}");
    isLoggedIn.value = true;
  }
}