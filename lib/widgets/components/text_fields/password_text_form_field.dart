import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  const PasswordTextFormField({ 
    Key? key,
    required this.onChanged,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.dark,
      textInputAction: TextInputAction.go,
      decoration: const InputDecoration(
        hintText: "Enter Your Password"
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
      obscureText: true,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}

