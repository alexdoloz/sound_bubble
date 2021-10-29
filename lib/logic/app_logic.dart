import 'package:flutter/material.dart';
import 'package:sound_bubble/models/sign_in_data.dart';
import 'package:sound_bubble/models/sign_up_data.dart';

enum UserState {
  beforeSetup, preLogin, postLogin
}

abstract class AppLogic {
  final userState = ValueNotifier(UserState.beforeSetup);

  Future<void> setup();
  Future<void> signIn(SignInData signInData);
  Future<void> signUp(SignUpData signUpData);
  Future<void> signOut();
}

class FakeAppLogic extends AppLogic {
  
  @override
  Future<void> signIn(SignInData signInData) async {
    print("Logged in with login ${signInData.login} and password ${signInData.password}");

    // isLoggedIn.value = true;
  }

  @override
  Future<void> signOut() async {
    // isLoggedIn.value = false;
  }

  @override
  Future<void> signUp(SignUpData signUpData) async {
    print("Signed up as ${signUpData.name} with login ${signUpData.login} and password ${signUpData.password}");
    // isLoggedIn.value = true;
  }

  @override
  Future<void> setup() async {
    // TODO: implement setup
    throw UnimplementedError();
  }
}