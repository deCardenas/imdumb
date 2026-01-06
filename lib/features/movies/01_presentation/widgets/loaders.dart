import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MovieVerticalCardLoader extends StatelessWidget {
  const MovieVerticalCardLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
      width: 220,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
    ).animate().shimmer(
      duration: 1500.ms,
      color: colorScheme.surfaceContainerHighest,
      curve: Curves.easeInOut,
    );
  }
}
