import 'package:flutter/material.dart';
import 'package:sound_bubble/models/sign_up_data.dart';
import 'package:sound_bubble/widgets/components/background_button.dart';
import 'package:sound_bubble/widgets/components/error_badge.dart';
import 'package:sound_bubble/widgets/components/gradient_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sound_bubble/widgets/components/prelogin_header.dart';
import 'package:sound_bubble/widgets/components/text_fields/email_text_form_field.dart';
import 'package:sound_bubble/widgets/components/text_fields/name_text_form_field.dart';
import 'package:sound_bubble/widgets/components/text_fields/password_text_form_field.dart';
import '../../theme.dart';

class SignUpPage extends StatefulWidget {
  final Function(SignUpData) onSignUp;
  final VoidCallback onAlreadyHaveAccount;
  final String? error;

  const SignUpPage({ 
    Key? key,
    required this.onSignUp,
    required this.onAlreadyHaveAccount,
    this.error,
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
    final error = widget.error;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Form(
          child: ListView(
            children: [
              const SizedBox(height: 80,),
              const PreloginHeader(title: "Sign Up",),
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
                  signUpData.login = login;
                },
              ),
              box16,
              NameTextFormField(
                onChanged: (name) {
                  signUpData.name = name;
                },
              ),
              box16,
              PasswordTextFormField(
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
              GradientButton(
                icon: const Icon(
                  Icons.cloud_upload_outlined,
                ),
                gradient: AppTheme.buttonGradient2,
                title: "Upload photo",
                onPressed: () async {
                  try {
                    final ImagePicker picker = ImagePicker();
                    signUpData.image = await picker.pickImage(source: ImageSource.gallery);
                  } catch (exception) {
                    // TODO: Handle exceptions
                  }
                },
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
              /*SizedBox(
                height: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: 
                    ),
                  ],
                ),
              ),*/
              // 
              // SizedBox(
              //   height: 40,
              //   child: 
              // ),
            ],
          ),
        )
      ),
    );
  }
}