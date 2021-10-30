import 'package:flutter/material.dart';

class OverlaySpinner extends StatefulWidget {
  final Widget child;
  final bool isSpinning;

  const OverlaySpinner({ 
    Key? key,
    required this.child,
    this.isSpinning = false,
  }) : super(key: key);

  @override
  State<OverlaySpinner> createState() => _OverlaySpinnerState();
}

class _OverlaySpinnerState extends State<OverlaySpinner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      clipBehavior: Clip.hardEdge,
      children: [
        widget.child,
        if (widget.isSpinning) 
          Container(
            color: const Color(0x77000000),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(Theme.of(context).progressIndicatorTheme.circularTrackColor),
                strokeWidth: 5,
              ),
            ),
          ),
      ],
    );
  }
}