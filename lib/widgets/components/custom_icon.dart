import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final int code;
  final Color color;

  const CustomIcon({
    Key? key,
    required this.code,
    this.color = Colors.white,
  }) : super(key: key);

  static const home = CustomIcon(code: 0xe801);
  static const music = CustomIcon(code: 0xe804);
  static const search = CustomIcon(code: 0xe803);
  static const chat = CustomIcon(code: 0xe802);
  static const profile = CustomIcon(code: 0xe805);

  @override
  Widget build(BuildContext context) {
    return Text(
      String.fromCharCode(code),
      style: TextStyle(
        fontFamily: "Custom",
        fontSize: 22.0,
        color: color,
      ),
    );
  }
}
