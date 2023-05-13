import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Warning extends StatelessWidget {
  const Warning({super.key});

  @override
  Widget build(BuildContext context) {
    Widget warningWidget = Container(
      color: const Color(0xff232426),
      padding: const EdgeInsets.all(25),
      child: Text('warning !'.toUpperCase()),
    )
        .animate(
          onPlay: (controller) => controller.repeat(reverse: true),
        )
        .scaleXY(end: 1.1, curve: Curves.easeInOutCubic)
        .tint(color: Colors.red, end: 0.6)
        .elevation(end: 20);
    return warningWidget;
  }
}
