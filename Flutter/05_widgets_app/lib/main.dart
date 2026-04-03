import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';
// import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
// import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
// import 'package:widgets_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(
    // * ProviderScope es necesario para poder usar Riverpod. Y tener acceso a los providers (Global State).
    const ProviderScope(child: MainApp()),
  );
}

// * ConsumerWidget es necesario para poder usar Riverpod. Y tener acceso a los providers (Global State).
class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch(isDarkModeProvider);
    final selectedColor = ref.watch(selectedColorProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    // MaterialApp.router es la forma recomendada para manejar las rutas de la aplicación.
    // * El theme se obtiene del provider AppTheme.
    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(), // Se obtiene el tema actual.
      // home: HomeScreen(),
      // Definición de rutas - "No recomendado para apps grandes"
      // routes: {
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardsScreen(),
      // },
    );
  }
}
