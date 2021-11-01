import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  final Function(String) onChanged;
  const EmailTextFormField({ 
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: false,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      keyboardAppearance: Brightness.dark,
      decoration: const InputDecoration(
        hintText: "Enter Your Email",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
      onChanged: onChanged,
    );
  }
}