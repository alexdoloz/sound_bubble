import 'package:flutter/material.dart';
import 'package:sound_bubble/models/sign_up_data.dart';
import 'package:sound_bubble/widgets/components/background_button.dart';
import 'package:sound_bubble/widgets/components/gradient_button.dart';
import '../../theme.dart';

class SignUpPage extends StatefulWidget {
  final Function(SignUpData) onSignUp;
  final VoidCallback onAlreadyHaveAccount;

  const SignUpPage({ 
    Key? key,
    required this.onSignUp,
    required this.onAlreadyHaveAccount,
  }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final signUpData = SignUpData(
    login: "",
    password: "",
    name: "",
  );

  static const box16 = SizedBox(
    height: 16,
  );

  signUp() {
    widget.onSignUp(signUpData);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Sign Up", style: Theme.of(context).textTheme.headline2),
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
                hintText: "Enter your Email",
              ).applyDefaults(theme.inputDecorationTheme),
              onChanged: (login) {
                signUpData.login = login;
              },
              onSubmitted: (_) {
                FocusScope.of(context).nextFocus();
              },
            ),
            box16,
            TextField(
              autocorrect: false,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              keyboardAppearance: Brightness.dark,
              decoration: const InputDecoration(
                hintText: "Enter your name",
              ).applyDefaults(theme.inputDecorationTheme),
              onChanged: (name) {
                signUpData.name = name;
              },
              onSubmitted: (_) {
                FocusScope.of(context).nextFocus();
              },
            ),
            box16,
            TextField(
              obscureText: true,
              keyboardAppearance: Brightness.dark,
              textInputAction: TextInputAction.go,
              decoration: const InputDecoration(
                hintText: "Create a password"
              ).applyDefaults(theme.inputDecorationTheme),
              onChanged: (password) {
                signUpData.password = password;
              },
              onSubmitted: (_) {
                signUp();
              },
            ),
            box16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: RadioListTile<bool>(
                    title: const Text('User'),
                    groupValue: signUpData.isArtist,
                    value: false,
                    onChanged: (bool? value) {
                      setState(() {
                        signUpData.isArtist = false;
                      });
                    },  
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: RadioListTile<bool>(
                    title: const Text('Author'),
                    groupValue: signUpData.isArtist,
                    value: true,
                    onChanged: (bool? value) {
                      setState(() {
                        signUpData.isArtist = true;
                      });
                    },  
                  ),
                ),
                const Spacer(),
              ],
            ),
            box16,
            SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: BackgroundButton(
                      backgroundColor: const Color(0xffae67ef),
                      title: "Upload photo",
                      onPressed: () {
                        print("Upload photo");
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: BackgroundButton(
                      backgroundColor: const Color(0xff4961ca),
                      title: "Sign Up",
                      onPressed: signUp,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GradientButton(
                      gradient: AppTheme.buttonGradient,
                      onPressed: widget.onAlreadyHaveAccount,
                      title: 'Already registered',
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}