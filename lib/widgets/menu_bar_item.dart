import 'package:flutter/material.dart';
import 'package:sound_bubble/widgets/app.dart';

class MenuBarItem extends StatelessWidget {
  final CustomIcon icon;

  const MenuBarItem({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 32,
      child: Container(
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }
}
