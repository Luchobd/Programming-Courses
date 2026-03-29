import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

// GoRouter configuration. "Recomendado para apps grandes".
// * Forma recomendada para manejar las rutas de la aplicación.
final appRouter = GoRouter(
  initialLocation: '/', // Ruta inicial de la aplicación.
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => ButtonsScreen(),
    ),

    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => CardsScreen(),
    ),

    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => ProgressScreen(),
    ),

    GoRoute(
      path: '/snackbars',
      name: SnackbarScreen.name,
      builder: (context, state) => SnackbarScreen(),
    ),

    GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      builder: (context, state) => AnimatedScreen(),
    ),
  ],
);