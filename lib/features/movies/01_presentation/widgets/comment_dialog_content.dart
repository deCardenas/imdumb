import 'package:flutter/material.dart';

class CommentDialogContent extends StatelessWidget {
  final String overview;
  final TextEditingController textController;
  const CommentDialogContent({
    super.key,
    required this.overview,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overview,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.4,
            color: colorScheme.onSurface.withAlpha(200),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Tu comentario',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.outline.withAlpha(100)),
          ),
          child: TextField(
            controller: textController,
            maxLines: 4,
            cursorColor: colorScheme.primary,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Escribe tu comentario…',
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withAlpha(120),
              ),
              contentPadding: const EdgeInsets.all(12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
