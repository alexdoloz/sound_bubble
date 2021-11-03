import 'package:flutter/material.dart';

/// Widget representing playlist in playlist widget
class PlaylistWidget extends StatelessWidget {
  final String name;
  final Image cover;
  final Color nameBackgroundColor;

  const PlaylistWidget({ 
    Key? key,
    required this.name,
    required this.cover,
    required this.nameBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            cover,
            Positioned(
              left: 0,
              bottom: 16,
              child: _NameBackground(
                name: name, 
                background: nameBackgroundColor
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NameBackground extends StatelessWidget {
  final Color background;
  final String name;

  const _NameBackground({ 
    Key? key,
    required this.name,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: Настроить констрейнты
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(11),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(11),
        )
      ),
      child: Text(
        name, 
        style: Theme.of(context).textTheme.headline6, // TODO: Настроить стили отдельно для прелогина и постлогина; уточнить стиль
      ),
    );
  }
}