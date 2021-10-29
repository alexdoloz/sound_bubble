import 'package:flutter/material.dart';

/// Начальный экран загрузки
class LoadingPage extends StatefulWidget {
  const LoadingPage({ Key? key }) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  var animateBackwards = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedScale(
        duration: const Duration(milliseconds: 1000),
        scale: animateBackwards ? 2.0 : 3.0,
        alignment: Alignment.center,
        onEnd: () {
          setState(() {
            animateBackwards = !animateBackwards;
          });
        },
        child: Image.asset("assets/images/logo.png")),
    );
  }
}