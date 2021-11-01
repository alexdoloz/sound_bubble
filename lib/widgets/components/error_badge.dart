import 'package:flutter/material.dart';

class ErrorBadge extends StatelessWidget {
  final String error;

  const ErrorBadge({ 
    Key? key,
    required this.error
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 244, 84, 106),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          error,
          style: Theme.of(context).textTheme.headline5,
        ),
      )
    );
  }
}