import 'package:flutter/material.dart';
import 'package:sound_bubble/logic/app_logic.dart';
import '../../app.dart';
import '../../theme.dart';
import 'loading_page.dart';
import 'login_page.dart';
import 'sign_up_page.dart';

/// Весь UI до логина в приложении
class PreloginZone extends StatefulWidget {
  const PreloginZone({ Key? key }) : super(key: key);

  @override
  _PreloginAppState createState() => _PreloginAppState();
}

class _PreloginAppState extends State<PreloginZone> {
  bool isLoggingIn = true;

  


  @override
  Widget build(BuildContext context) {
    Widget loginPage = LoginPage(
      onSignIn: (signInData) {
        appLogic.signIn(signInData);
      }, 
      onSignUp: () {
        setState(() {
          isLoggingIn = false;
        });
      }
    );

    Widget signUpPage = SignUpPage(
      onSignUp: (signUpData) {
        appLogic.signUp(signUpData);
      },
      onAlreadyHaveAccount: () {
        setState(() {
          isLoggingIn = true;
        });
      }
    );
   
    return MaterialApp(
      title: "Soundbubble",
      theme: AppTheme.theme,
      home: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: appLogic.userState,
          builder: (context, UserState userState, _) {
            var page = userState == UserState.beforeSetup ? 
              const LoadingPage() : 
              (isLoggingIn ? loginPage : signUpPage);
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: page,
            );
          },
        ),
      ),
    );
  }
}
