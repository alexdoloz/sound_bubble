import 'package:flutter/material.dart';
import 'package:sound_bubble/models/sign_in_data.dart';
import 'package:sound_bubble/models/sign_up_data.dart';

enum UserState {
  beforeSetup, preLogin, postLogin
}

/// Для одновременного пораза разных анимаций загрузки на экране, когда разные куски данных загружаются одновременно
enum LoadingId {
  other
}

abstract class AppLogic {
  final userState = ValueNotifier(UserState.beforeSetup);
  final loadingIds = ValueNotifier(<LoadingId>{});

  Future<void> setup();
  Future<void> signIn(SignInData signInData);
  Future<void> signUp(SignUpData signUpData);
  Future<void> signOut();

  startLoading({ LoadingId loadingId = LoadingId.other }) {
    final currentIds = loadingIds.value.toSet();
    currentIds.add(loadingId);
    loadingIds.value = currentIds;
  }

  stopLoading({ LoadingId loadingId = LoadingId.other }) {
    final currentIds = loadingIds.value.toSet();
    currentIds.remove(loadingId);
    loadingIds.value = currentIds;
  }
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