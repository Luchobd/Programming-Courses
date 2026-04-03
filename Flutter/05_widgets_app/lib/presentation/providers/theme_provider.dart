import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable.
final colorListProvider = Provider((ref) => colorList);

// Estado para el modo claro/oscuro.
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Un objeto de tipo AppTheme (custom).
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE =. Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    // Se crea una nueva instancia de AppTheme con el valor invertido de isDarkMode. Utilizando copyWith.
    // Esto es necesario porque los objetos en Dart son inmutables. El copyWith nos ayuda a crear una nueva instancia con los valores actualizados.
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    // Se crea una nueva instancia de AppTheme con el valor del colorIndex. Utilizando copyWith.
    // Esto es necesario porque los objetos en Dart son inmutables. El copyWith nos ayuda a crear una nueva instancia con los valores actualizados.
    state = state.copyWith(selectedColor: colorIndex);
  }
}
