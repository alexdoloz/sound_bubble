import 'package:flutter/material.dart';

enum TrackItemButtonType {
  add, delete, more
}

class TrackItemButton extends StatelessWidget {
  final TrackItemButtonType type;
  final VoidCallback onPressed;

  static const _icons = {
    TrackItemButtonType.add: Icons.add_circle_outline,
    TrackItemButtonType.more: Icons.more_vert,
    TrackItemButtonType.delete: Icons.remove_circle_outline
  };

  const TrackItemButton({ 
    Key? key,
    required this.type,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),

      onPressed: onPressed, 
      icon: Icon(_icons[type], size: 24, color: Colors.white,),
      highlightColor: Colors.grey,
      focusColor: Colors.green,
    );
  }
}