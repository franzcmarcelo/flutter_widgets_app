import 'package:go_router/go_router.dart' show GoRouter, GoRoute;
import 'package:flutter_widgets_app/presentations/screens/screens.dart' show HomeScreen, ButtonsScreen, CardsScreen;

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);
