import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

// GoRouter configuration. "Recomendado para apps grandes".
// * Forma recomendada para manejar las rutas de la aplicación.
final appRouter = GoRouter(
  initialLocation: '/', // Ruta inicial de la aplicación.
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),

    GoRoute(
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
  ],
);