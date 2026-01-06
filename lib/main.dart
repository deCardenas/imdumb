import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:imdumb/app_theme.dart' show lightTheme, darkTheme;
import 'package:imdumb/core/loggers/state_logger.dart';
import 'package:imdumb/firebase_options.dart' show DefaultFirebaseOptions;
import 'package:imdumb/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _initCrashlytics();

  runApp(
    ProviderScope(
      observers: kDebugMode ? [StateLogger()] : null,
      child: const MyApp(),
    ),
  );
}

Future<void> _initCrashlytics() async {
  // 1. Habilitar / deshabilitar según entorno
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
    !kDebugMode,
  );

  // 2. Errores síncronos de Flutter
  FlutterError.onError = (FlutterErrorDetails details) {
    if (!kDebugMode) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    }
  };

  // 3. Errores asíncronos (Zone)
  PlatformDispatcher.instance.onError = (error, stack) {
    if (!kDebugMode) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
    return true;
  };
}

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      navigatorKey: MyApp.navigatorKey,
      routes: $appRoutes,
      initialLocation: '/',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IMDUMB',
      routerConfig: _router,
      supportedLocales: [const Locale('es')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) return supportedLocales.first;

        return supportedLocales.firstWhere(
          (l) => l.languageCode == locale.languageCode,
          orElse: () => supportedLocales.first,
        );
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
