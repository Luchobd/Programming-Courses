import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hello World!!'), // Contenido del snackbar.
      action: SnackBarAction(
        label: 'OK!!',
        onPressed: () {},
      ), // Botón de acción.
      duration: const Duration(seconds: 2), // Duración del snackbar.
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  // * Método para mostrar un diálogo.
  void openDialog(BuildContext context) {
    showDialog(
      context: context, // Contexto de la aplicación.
      barrierDismissible:
          false, // No se puede cerrar el diálogo haciendo clic fuera de él.
      builder: (BuildContext context) => AlertDialog(
        //  Widget que se va a mostrar.
        title: const Text('¿Estás seguro?'), //  Título del diálogo.
        content: const Text(
          //  Contenido del diálogo.
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
        actions: [
          // Botones de acción.
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars y Diálogos')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    ),
                  ],
                );
              },
              child: Text('Licencias usadas'),
            ),
            FilledButton(
              onPressed: () => openDialog(context),
              child: Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
