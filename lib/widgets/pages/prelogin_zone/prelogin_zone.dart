import 'package:flutter/material.dart';
import 'package:sound_bubble/logic/app_logic.dart';
import 'package:sound_bubble/widgets/components/overlay_spinner.dart';
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
  var userState = UserState.beforeSetup;
  var loadingIds = <LoadingId>{};
  get isLoading => loadingIds.contains(LoadingId.other);

  @override
  void initState() {
    super.initState();
    appLogic.userState.addListener(userStateUpdated);
    appLogic.loadingIds.addListener(loadingIdsUpdated);
  }

  @override
  void dispose() {
    super.dispose();
    appLogic.userState.removeListener(userStateUpdated);
    appLogic.loadingIds.removeListener(loadingIdsUpdated);
  }

  userStateUpdated() {
    setState(() {
      userState = appLogic.userState.value;
    });
  }

  loadingIdsUpdated() {
    setState(() {
      loadingIds = appLogic.loadingIds.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget loginPage = 
      OverlaySpinner(
        isSpinning: isLoading,
        child: LoginPage(
          onSignIn: (signInData) async {
            await appLogic.signIn(signInData);
          }, 
          onSignUp: () {
            setState(() {
              isLoggingIn = false;
            });
          }
        ),
      );

    Widget signUpPage = 
      OverlaySpinner(
        isSpinning: isLoading,
        child: SignUpPage(
          onSignUp: (signUpData) async {
            await appLogic.signUp(signUpData);
          },
          onAlreadyHaveAccount: () {
            setState(() {
              isLoggingIn = true;
            });
          }
        ),
      );
   
    return MaterialApp(
      title: "Soundbubble",
      theme: AppTheme.theme,
      home: Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: isLoggingIn ? loginPage : signUpPage,
        ),
      ),
    );
  }
}
