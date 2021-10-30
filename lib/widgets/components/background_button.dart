import 'package:flutter/material.dart';

class BackgroundButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final Icon? icon;

  const BackgroundButton({ 
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.onPressed,
    this.icon,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                ...[icon!, const SizedBox(width: 8,)],
              Text(title),
            ],
          )
        ),
      ),
    );
  }
}

