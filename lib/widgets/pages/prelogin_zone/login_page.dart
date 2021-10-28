import 'package:flutter/material.dart';
import 'package:sound_bubble/models/sign_in_data.dart';
import 'package:sound_bubble/widgets/components/background_button.dart';
import 'package:sound_bubble/widgets/components/gradient_button.dart';
import '../../theme.dart';

class LoginPage extends StatefulWidget {
  final Function(SignInData) onSignIn;
  final VoidCallback onSignUp;

  const LoginPage({ 
    Key? key,
    required this.onSignIn,
    required this.onSignUp,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final signInData = SignInData(login: "", password: "");

  static const box16 = SizedBox(
    height: 16,
  );

  signIn() {
    widget.onSignIn(signInData);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final passwordFocusNode = FocusNode();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Log In", style: Theme.of(context).textTheme.headline2),
                const Spacer(flex: 1,),
                Image.asset("assets/images/logo.png"),
              ],
            ),
            box16,
            TextField(
              enableSuggestions: false,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
              decoration: const InputDecoration(
                hintText: "Enter Your Email",
              ).applyDefaults(theme.inputDecorationTheme),
              onChanged: (login) {
                signInData.login = login;
              },
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
            ),
            box16,
            TextField(
              keyboardAppearance: Brightness.dark,
              textInputAction: TextInputAction.go,
              decoration: const InputDecoration(
                hintText: "Enter Your Password"
              ).applyDefaults(theme.inputDecorationTheme),
              focusNode: passwordFocusNode,
              obscureText: true,
              onChanged: (password) {
                signInData.password = password;
              },
              onSubmitted: (_) {
                signIn();
              },
            ),
            box16,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: BackgroundButton(
                    backgroundColor: const Color(0xff4961ca),
                    title: "Log In",
                    onPressed: signIn,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GradientButton(
                    gradient: AppTheme.buttonGradient,
                    onPressed: widget.onSignUp,
                    title: 'Create new account',                    
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}