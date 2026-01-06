import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: const Color(0xFF2DD4BF),
  onPrimary: const Color(0xFF022C22),
  primaryContainer: const Color(0xFFECFEFF),
  onPrimaryContainer: const Color(0xFF022C22),

  secondary: const Color(0xFF5EEAD4),
  onSecondary: const Color(0xFF022C22),
  secondaryContainer: const Color(0xFFD1FAE5),
  onSecondaryContainer: const Color(0xFF022C22),

  tertiary: const Color(0xFF99F6E4),
  onTertiary: const Color(0xFF022C22),
  tertiaryContainer: const Color(0xFFECFEFF),
  onTertiaryContainer: const Color(0xFF022C22),

  error: const Color(0xFFEF4444),
  onError: Colors.white,
  errorContainer: const Color(0xFFFEE2E2),
  onErrorContainer: const Color(0xFF7F1D1D),

  surface: const Color(0xFFF0FDFA),
  onSurface: const Color(0xFF022C22),

  surfaceContainerLowest: Colors.white,
  surfaceContainerLow: const Color(0xFFECFEFF),
  surfaceContainer: const Color(0xFFD1FAE5),
  surfaceContainerHigh: const Color(0xFF99F6E4),
  surfaceContainerHighest: const Color(0xFF5EEAD4),

  outline: const Color(0xFF5EEAD4),
  outlineVariant: const Color(0xFF99F6E4),

  shadow: Colors.black,
  scrim: Colors.black,

  inverseSurface: const Color(0xFF022C22),
  onInverseSurface: Colors.white,
  inversePrimary: const Color(0xFF2DD4BF),
);

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  primary: const Color(0xFF2DD4BF),
  onPrimary: const Color(0xFF022C22),
  primaryContainer: const Color(0xFF134E4A),
  onPrimaryContainer: const Color(0xFF99F6E4),

  secondary: const Color(0xFF5EEAD4),
  onSecondary: const Color(0xFF022C22),
  secondaryContainer: const Color(0xFF0F766E),
  onSecondaryContainer: const Color(0xFFD1FAE5),

  tertiary: const Color(0xFF99F6E4),
  onTertiary: const Color(0xFF022C22),
  tertiaryContainer: const Color(0xFF134E4A),
  onTertiaryContainer: const Color(0xFFECFEFF),

  error: const Color(0xFFF87171),
  onError: const Color(0xFF7F1D1D),
  errorContainer: const Color(0xFF991B1B),
  onErrorContainer: const Color(0xFFFEE2E2),

  // 🌌 Superficies cinematográficas
  surface: const Color(0xFF020617),
  onSurface: const Color(0xFFE6FFFA),

  surfaceContainerLowest: const Color(0xFF020617),
  surfaceContainerLow: const Color(0xFF020617),
  surfaceContainer: const Color(0xFF022C22),
  surfaceContainerHigh: const Color(0xFF134E4A),
  surfaceContainerHighest: const Color(0xFF0F766E),

  outline: const Color(0xFF5EEAD4),
  outlineVariant: const Color(0xFF134E4A),

  shadow: Colors.black,
  scrim: Colors.black,

  inverseSurface: const Color(0xFFE6FFFA),
  onInverseSurface: const Color(0xFF020617),
  inversePrimary: const Color(0xFF2DD4BF),
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.surface,
  navigationBarTheme: NavigationBarThemeData(
    height: 68,
    elevation: 4,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(fontWeight: FontWeight.w600),
    ),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(size: 26);
      }
      return const IconThemeData(size: 22);
    }),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.primaryContainer,
      foregroundColor: lightColorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
  navigationBarTheme: NavigationBarThemeData(
    height: 68,
    elevation: 4,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(fontWeight: FontWeight.w600),
    ),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(size: 26);
      }
      return const IconThemeData(size: 22);
    }),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkColorScheme.primaryContainer,
      foregroundColor: darkColorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),
);
