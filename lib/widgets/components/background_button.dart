import 'package:flutter/material.dart';

class BackgroundButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const BackgroundButton({ 
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 1000,
        height: 40,
        child: Container(
          alignment: Alignment.center,
          child: Text(title)
        ),
      ),
    );
  }
}

