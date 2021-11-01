import 'package:flutter/material.dart';
import 'package:sound_bubble/models/sign_in_data.dart';
import 'package:sound_bubble/widgets/components/background_button.dart';
import 'package:sound_bubble/widgets/components/error_badge.dart';
import 'package:sound_bubble/widgets/components/gradient_button.dart';
import 'package:sound_bubble/widgets/components/prelogin_header.dart';
import 'package:sound_bubble/widgets/components/text_fields/email_text_form_field.dart';
import 'package:sound_bubble/widgets/components/text_fields/password_text_form_field.dart';
import '../../theme.dart';

class LoginPage extends StatefulWidget {
  final Function(SignInData) onSignIn;
  final VoidCallback onSignUp;
  final String? error;

  const LoginPage({ 
    Key? key,
    required this.onSignIn,
    required this.onSignUp,
    this.error,
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
    final error = widget.error;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Form(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              const SizedBox(height: 80,),
              const PreloginHeader(title: "Log In",),
              box16,
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: error == null ? const SizedBox(height: 0,) : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ErrorBadge(error: error,),
                    box16,
                  ],
                ),
              ),
              EmailTextFormField(
                onChanged: (login) {
                  signInData.login = login;
                },
              ),
              box16,
              PasswordTextFormField(
                onChanged: (password) {
                  signInData.password = password;
                },
                onSubmitted: (_) {
                  signIn();
                }
              ),
              box16,
              BackgroundButton(
                title: "GUF", 
                backgroundColor: Colors.red, 
                onPressed: () {
                  widget.onSignIn(SignInData(login: 'guf@temp.temp', password: '123456'));
                }
              ),
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
          ),
        ),
      ),
    );
  }
}