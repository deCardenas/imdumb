import 'package:flutter/material.dart';

import 'grid_painter.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = scheme.brightness == Brightness.dark;

    return Stack(
      children: [
        // 🎨 Gradiente base
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [const Color(0xFF020617), const Color(0xFF0F766E)]
                  : [const Color(0xFFD1FAE5), const Color(0xFF2DD4BF)],
            ),
          ),
        ),

        // 🧮 Grid sutil
        CustomPaint(
          size: Size.infinite,
          painter: GridPainter(
            color: scheme.onSurface.withOpacity(isDark ? 0.06 : 0.08),
          ),
        ),

        // Contenido
        child,
      ],
    );
  }
}
