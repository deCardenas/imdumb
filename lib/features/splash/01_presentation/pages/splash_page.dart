import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imdumb/core/assets/assets.gen.dart';
import 'package:imdumb/core/services/remote_config_service.dart';
import 'package:imdumb/routes/app_router.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    // Simula carga inicial

    // Aquí normalmente:
    // - Firebase Remote Config
    await Future.wait([
      RemoteConfigService.instance.init(),
      Future.delayed(const Duration(seconds: 2)),
    ]);
    // - Auth
    // - Tokens
    // - Configuración inicial

    const HomeRoute().go(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.images.icLauncher.image(width: 150, height: 150),
      ),
    );
  }
}
