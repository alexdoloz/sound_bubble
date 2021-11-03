import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// Tabs switcher
class SegmentedControl extends StatelessWidget {
  final int selectedIndex;
  final List<String> tabs;
  final Function(int) onSelectedIndexChanged;

  const SegmentedControl({ 
    Key? key,
    required this.selectedIndex,
    required this.tabs,
    required this.onSelectedIndexChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> map = { for (var tab in tabs) tab : Text(tab) };
    return CupertinoSegmentedControl(
      groupValue: tabs[selectedIndex],
      onValueChanged: (String tab) {
        final index = tabs.indexOf(tab);
        onSelectedIndexChanged(index);
      },
      children: map,
    );
  }
}