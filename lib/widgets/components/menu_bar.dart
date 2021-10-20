import 'dart:convert';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:sound_bubble/utils/palette.dart';
import 'package:sound_bubble/widgets/components/menu_bar_item.dart';

class MenuBar extends StatefulWidget {
  final List<MenuBarItem> items;
  final int initialSelectedIndex;
  final bool showsDivider;
  final Function(int index) onTap;

  const MenuBar({
    Key? key,
    required this.items,
    int selectedIndex = 0,
    this.showsDivider = false,
    required this.onTap,
  }) : initialSelectedIndex = selectedIndex,
        super(key: key);

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.showsDivider)
          Container(
            height: 1,
            color: Palette.menuBarDivider,
          ),
        Container(
          height: 57,
          color: Palette.menuBarBackground,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.items.mapIndexed(
              (index, item) => GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: selectedIndex == index ? 1 : 0.7,
                  child: Expanded(flex: 1, child: item),
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    widget.onTap(index);
                  });
                },
              ),
            ).toList(),
          ),
        )
      ],
    );
  }
}
