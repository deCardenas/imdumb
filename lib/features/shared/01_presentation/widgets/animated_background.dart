import 'package:flutter/material.dart';

import 'grid_painter.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final bool showGrid;

  const AnimatedBackground({
    super.key,
    required this.child,
    required this.showGrid,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Color> _darkColors(double t) => [
    Color.lerp(const Color(0xFF020617), const Color(0xFF022C22), t)!,
    Color.lerp(const Color(0xFF0F766E), const Color(0xFF134E4A), t)!,
  ];

  List<Color> _lightColors(double t) => [
    Color.lerp(const Color(0xFFD1FAE5), const Color(0xFFECFEFF), t)!,
    Color.lerp(const Color(0xFF2DD4BF), const Color(0xFF5EEAD4), t)!,
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = scheme.brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        final colors = isDark
            ? _darkColors(_controller.value)
            : _lightColors(_controller.value);

        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors,
                ),
              ),
            ),

            if (widget.showGrid)
              CustomPaint(
                size: Size.infinite,
                painter: GridPainter(
                  color: scheme.onSurface.withAlpha(isDark ? 13 : 18),
                ),
              ),

            widget.child,
          ],
        );
      },
    );
  }
}
