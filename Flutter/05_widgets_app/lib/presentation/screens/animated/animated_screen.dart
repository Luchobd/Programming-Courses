import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 120; // 50 - 350. nextInt(max) no incluye el max. Funciona como un rango.
    height = random.nextInt(300) + 120; // 50 - 350. Funciona como un rango.
    borderRadius = random.nextInt(100) + 20; // 10 - 110. Funciona como un rango.
    color = Color.fromRGBO(
      random.nextInt(255), // red 
      random.nextInt(255), // green
      random.nextInt(255), // blue
      random.nextDouble() // opacity
    ); // 0 - 4294967295. Funciona como un rango.

    // Para que Flutter sepa que debe re-dibujar el widget, debemos llamar a setState.
    setState(() {}); // setState es un método que pertenece a la clase State. Se utiliza para notificar a Flutter que el estado del widget ha cambiado y que debe ser re-dibujado. Es un controlador de estado.

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),

      body: Center(
        // AnimatedContainer es un widget que permite animar los cambios en sus propiedades.
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic, // Curva de animación. 
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => changeShape(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
