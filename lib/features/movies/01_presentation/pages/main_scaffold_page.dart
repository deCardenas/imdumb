import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouterHelper, GoRouterState;
import 'package:imdumb/core/assets/assets.gen.dart';
import 'package:imdumb/routes/app_router.dart';

class MainScaffoldPage extends StatelessWidget {
  const MainScaffoldPage({super.key, required this.child});

  final Widget child;

  static const _routes = ['/home', '/explore', '/favorites'];

  int _locationToIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return _routes.indexWhere(location.startsWith);
  }

  @override
  Widget build(BuildContext context) {
    final index = _locationToIndex(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Assets.images.icLauncher.image(height: 16, width: 16),
        ),
        title: const Text('IMDUMB'),
        actions: [
          IconButton(
            onPressed: () {
              const SettingsRoute().push(context);
            },
            icon: const Icon(Icons.settings),
            tooltip: 'Configuración',
          ),
          IconButton(
            onPressed: () {
              const SearchRoute().push(context);
            },
            icon: const Icon(Icons.search),
            tooltip: 'Busqueda',
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index < 0 ? 0 : index,
        onDestinationSelected: (i) {
          context.go(_routes[i]);
        },
        animationDuration: Duration(milliseconds: 300),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Explora',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
