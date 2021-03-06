import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Gradient gradient;
  final String title;
  final VoidCallback onPressed;
  final Icon? icon;

  const GradientButton({ 
    Key? key,
    required this.title,
    required this.gradient,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: onPressed,
      clipBehavior: Clip.antiAlias,
      child: Ink(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            width: 1000,
            height: 40,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    ...[icon!, const SizedBox(width: 8,)],
                  Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

