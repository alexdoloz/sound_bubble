import 'package:flutter/material.dart';

class PreloginHeader extends StatelessWidget {
  final String title;

  const PreloginHeader({ 
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline2),
        const Spacer(flex: 1,),
        Image.asset("assets/images/logo.png"),
      ],
    );
  }
}