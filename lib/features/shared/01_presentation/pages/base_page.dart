import 'package:flutter/material.dart';
import 'package:imdumb/features/shared/01_presentation/widgets/animated_background.dart';

class BasePage extends StatelessWidget {
  final Widget child;
  final bool safeArea;
  final bool showGrid;

  const BasePage({
    super.key,
    required this.child,
    this.safeArea = true,
    this.showGrid = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = AnimatedBackground(showGrid: showGrid, child: child);

    if (safeArea) {
      content = SafeArea(child: content);
    }

    return Scaffold(backgroundColor: Colors.transparent, body: content);
  }
}
