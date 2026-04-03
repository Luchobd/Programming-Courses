import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';

  const ThemeChangerScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isDarkMode = ref.watch(isDarkModeProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer Screen'),
        actions: [
          IconButton(
            onPressed: () {
              // Forma 4: Usando el toggleDarkMode del notifier.
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              
              // Forma 3: Usando el notifier.
              // ref.read(isDarkModeProvider.notifier).update((state) => !state);

              // // 1. Forma 1: Maneja el estado directamente.
              // ref.read(isDarkModeProvider.notifier).state = !isDarkMode;

              // // 2. Forma 2: Usa un callback para actualizar el estado.
              // // ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
            icon: Icon(
              isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorListProvider);

    // final int selectedColor = ref.watch(selectedColorProvider); 
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        // RadioListTile requiere un valor y un grupo de valores. Funciona para seleccionar uno de varios.
        return // Este es el nuevo widget envoltorio. Para agrupar los RadioListTile.
        RadioGroup<int>(
          // 1. El estado y el evento se declaran UNA SOLA VEZ aquí arriba
          groupValue: selectedColor, // Valor actual del radio group.
          onChanged: (value) {
            // Modifica el estado del provider selectedColorProvider.
            // ref.read(selectedColorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          },
          // 2. Agrupas tus opciones en una columna (o cualquier otro layout)
          child: Column(
            children: [
              RadioListTile<int>(
                title: Text('Este color', style: TextStyle(color: color),), // Muestra el color
                subtitle: Text('Valor: ${color.toARGB32()}'), // Obtiene el valor en formato ARGB32
                activeColor: color, // Color del radio button cuando está seleccionado
                value: index, // Valor único para identificar la opción
                // Ya no necesitas groupValue ni onChanged aquí
              ),
            ],
          ),
        );
      },
    );
  }
}
