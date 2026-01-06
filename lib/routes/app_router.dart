import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imdumb/features/movies/01_presentation/pages/explore_page.dart';
import 'package:imdumb/features/movies/01_presentation/pages/favorites_page.dart';
import 'package:imdumb/features/movies/01_presentation/pages/home_page.dart';
import 'package:imdumb/features/movies/01_presentation/pages/main_scaffold_page.dart';
import 'package:imdumb/features/movies/01_presentation/pages/movie_detail_page.dart';
import 'package:imdumb/features/movies/01_presentation/pages/search_page.dart';
import 'package:imdumb/features/settings/01_presentation/pages/settings_page.dart';
import 'package:imdumb/features/splash/01_presentation/pages/splash_page.dart';

part 'app_router.g.dart';

@TypedGoRoute<SplashRoute>(path: '/')
final class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedShellRoute<MainShellRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: '/home'),
    TypedGoRoute<FavoritesRoute>(path: '/favorites'),
    TypedGoRoute<ExploreRoute>(path: '/explore'),
  ],
)
final class MainShellRoute extends ShellRouteData {
  const MainShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainScaffoldPage(child: navigator);
  }
}

final class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

final class FavoritesRoute extends GoRouteData with $FavoritesRoute {
  const FavoritesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FavoritesPage();
  }
}

final class ExploreRoute extends GoRouteData with $ExploreRoute {
  const ExploreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExplorePage();
  }
}

@TypedGoRoute<SettingsRoute>(path: '/settings')
final class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}

@TypedGoRoute<SearchRoute>(path: '/search')
final class SearchRoute extends GoRouteData with $SearchRoute {
  const SearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchPage();
  }
}

@TypedGoRoute<MovieDetailRoute>(path: '/movie/:id')
final class MovieDetailRoute extends GoRouteData with $MovieDetailRoute {
  const MovieDetailRoute({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MovieDetailPage(movieId: id);
  }
}
